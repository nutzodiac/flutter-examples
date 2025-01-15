import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../dio/dio.dart';
import '../../../utils/global.dart';
import '../model/request/temp_request_model.dart';

mixin class TempRepository {
  Future<Response> getLabel() async {
    Response responses = await MyDio.configureDio().post(Global.apiLang);
    return responses;
  }

  Future<Response> login(TempRequestModel tempRequestModel) async {
    Response responses = await MyDio.configureDio().post(Global.apiLogin, data: json.encode(tempRequestModel.toJson()));
    return responses;
  }
}
