import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/model/user/user.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';

import '../api_service.dart';
import '../../../feature/auth/model/register_request_model.dart';

class AuthRepo {
  final ApiService apiService;
  final Connectivity connectivity;

  AuthRepo({required this.apiService, required this.connectivity});

  Future<ResponseResult<AuthResponseModel>> register(
      RegisterRequestModel requestBody) async {
    return await connectivity.checkInternetBefore(
      onInternetConnected: () {
        return apiService.register(requestBody);
      },
    );
  }

  Future<ResponseResult<AuthResponseModel>> login(
      LoginRequestModel requestBody) async {
    return await connectivity.checkInternetBefore(
      onInternetConnected: () {
        return apiService.login(requestBody);
      },
    );
  }

  Future<ResponseResult<AuthResponseModel>> createUser(
      User user) async {
    return await connectivity.checkInternetBefore(
      onInternetConnected: () {
        return apiService.createUser(user);
      },
    );
  }
}
