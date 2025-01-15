import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/routes/routes.dart';

import '../components/dialog/dialog_custom.dart';
import '../helper/navigator_service.dart';
import '../utils/global.dart';
import '../utils/log.dart';
import '../utils/shared_pref.dart';
import '../utils/storage.dart';

Storage storage = Storage();
SharedPref spf = SharedPref();

class MyDio {
  static final options = BaseOptions(
    baseUrl: Global.baseUrl,
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
  );

  static Dio configureDio() {
    final Dio dio = Dio(options);
    dio.interceptors.add(MyInterceptors());
    return dio;
  }
}

class MyInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Log.d('REQUEST[${options.method}] => PATH: ${options.path}');
    try {
      String? token = await storage.readStorageData(Storage.tokenKey);
      String? language = await spf.read(SharedPref.languageKey);
      options.headers["token"] = token ?? "";
      if (language != null) {
        options.headers["lang"] = json.decode(language);
      } else {
        options.headers["lang"] = "th";
      }
      super.onRequest(options, handler);
    } on DioException catch (e) {
      if (e.response != null) {
        Log.d(e.response?.data);
        Log.d(e.response?.headers);
        Log.d(e.response?.requestOptions);
      } else {
        Log.d(e.requestOptions);
        Log.d(e.message);
      }
    }
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    Log.d(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    Log.d('response: ${response.data}');
    try {
      // If have token expired depending on your project //
      CancelToken cancelToken = CancelToken();
      String? newToken = response.data['body']['token'];
      String? resultCode = response.data['body']['resultcode'];
      if (resultCode == "-999" && newToken != null && response.requestOptions.path != "") {
        await storage.writeStorageData(Storage.tokenKey, newToken);
        response.requestOptions.headers["token"] = newToken;
        final opts = Options(
          method: response.requestOptions.method,
        );
        response.requestOptions.headers["token"] = newToken;
        Response responseNew = await MyDio.configureDio().request(
            response.requestOptions.path,
            options: opts,
            cancelToken: cancelToken,
            data: response.requestOptions.data,
            queryParameters: response.requestOptions.queryParameters);
        super.onResponse(responseNew, handler);
      } else {
        if (resultCode == "001") {
          if (!Global.isReloadedToken) {
            Global.isReloadedToken = true;
            final opts = Options(
              method: response.requestOptions.method,
            );
            response.requestOptions.headers["token"] = newToken;
            Response responseNewToken = await MyDio.configureDio().request(
                response.requestOptions.path,
                options: opts,
                cancelToken: cancelToken,
                data: response.requestOptions.data,
                queryParameters: response.requestOptions.queryParameters);
            cancelToken.cancel('cancelled');
            return handler.resolve(responseNewToken);
          } else {
            cancelToken.cancel('cancelled');
            MyDialog().showDialogMessage(
              context: NavigationService.navigatorKey.currentContext!,
              message: "Your session has timed out. Please login again",
              buttonLabel: "Ok",
              callback: () async {
                await storage.logout();
                Global.isReloadedToken = false;
                popUntil('/home');
              },
            );
          }
        }
      }

      super.onResponse(response, handler);
    } on DioException catch (e) {
      if (e.response != null) {
        Log.d(e.response?.data);
        Log.d(e.response?.headers);
        Log.d(e.response?.requestOptions);
      } else {
        Log.d(e.requestOptions);
        Log.d(e.message);
      }
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    Log.d(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    String message = "";
    try {
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
          MyDialog().showDialogMessage(
              context: NavigationService.navigatorKey.currentContext!,
              message: "Connection timeout. Please try again later.",
              buttonLabel: "Ok",
              callback: () {
                Navigator.pop(NavigationService.navigatorKey.currentContext!);
              });
        case DioExceptionType.receiveTimeout:
          MyDialog().showDialogMessage(
              context: NavigationService.navigatorKey.currentContext!,
              message: "Receive timeout. Please try again later.",
              buttonLabel: "Ok",
              callback: () {
                Navigator.pop(NavigationService.navigatorKey.currentContext!);
              });
        case DioExceptionType.badResponse:
          if (err.response?.statusCode == 502) {
            message =
                'Server error - the server failed to fulfil an apparently valid request';
          }
          MyDialog().showDialogMessage(
              context: NavigationService.navigatorKey.currentContext!,
              message: message,
              buttonLabel: "Ok",
              callback: () {
                Navigator.pop(NavigationService.navigatorKey.currentContext!);
              });
        default:
          MyDialog().showDialogDefaultMessage(
              context: NavigationService.navigatorKey.currentContext!);
      }
      super.onError(err, handler);
    } on DioException catch (e) {
      Log.d(e);
    }
  }
}
