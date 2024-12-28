import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../data/api_consts.dart';
import '../data/model/domain_error_model.dart';
import '../data/response_result.dart';

extension InternetCheckHelper on Connectivity {
  Future<ResponseResult<T>> checkInternetBefore<T>(
      {required Future<ResponseResult<T>> Function()
      onInternetConnected}) async {
    try {
      final result = await checkConnectivity();
      if (result.isNotEmpty) {
        return await onInternetConnected();
      }
      return const Error(DomainErrorModel(
        message: "No Internet Connection",
        code: StatusCodes.noInternet,
      ));
    } on HandshakeException {
      // this error typically occurs when we make http request and there is no actual connection
      return const Error(DomainErrorModel(
        message: "No Internet Connection",
        code: StatusCodes.noInternet,
      ));
    } on http.ClientException {
      return const Error(DomainErrorModel(
        message: "No Internet Connection",
        code: StatusCodes.noInternet,
      ));
    }
  }
}