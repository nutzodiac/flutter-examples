import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project/dio/dio.dart';

import '../../../utils/global.dart';
import '../../mock/model/request/login_request_model.dart';

mixin class LoginRepository {
  Future<Response> login(LoginRequestModel loginRequestModel) async {
    Response responses = await MyDio.configureDio().post(Global.apiLogin, data: json.encode(loginRequestModel.toJson()));
    return responses;
  }
}
