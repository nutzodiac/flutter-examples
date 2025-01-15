import 'package:dio/dio.dart';

import '../../../dio/dio.dart';
import '../../../utils/global.dart';

mixin class MockRepository {
  Future<Response> getLabel() async {
    Response responses = await MyDio.configureDio().post(Global.apiLang);
    return responses;
  }
}
