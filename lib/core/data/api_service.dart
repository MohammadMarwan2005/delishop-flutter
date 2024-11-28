import 'dart:convert';

import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';
import 'package:delishop/feature/auth/model/register_request_model.dart';
import 'package:http/http.dart' as http;

import 'api_consts.dart';

class ApiService {
  final http.Client _httpClient;

  ApiService({required http.Client httpClient}) : _httpClient = httpClient;

  Future<ResponseResult<AuthResponseModel>> login(LoginRequestModel body) async {
    print('apiService.login');
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.loginUrl),
      headers: CommonConsts.acceptJsonHeader,
      body: jsonEncode(body.toJson()),
    );
    print('Body: ${httpResponse.body.toString()}');
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }
  Future<ResponseResult<AuthResponseModel>> register(RegisterRequestModel body) async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.registerUrl),
      headers: CommonConsts.acceptJsonHeader,
      body: jsonEncode(body.toJson()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }
}
