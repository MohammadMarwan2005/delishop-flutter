import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import '../data/api_consts.dart';
import '../data/model/domain_error_model.dart';
import '../data/response_result.dart';

ResponseResult<T> getNoInternetDomainError<T>() => const Error(DomainErrorModel(
      message: "No Internet Connection",
      code: StatusCodes.noInternet,
    ));

extension InternetCheckHelper on Connectivity {
  Future<ResponseResult<T>> checkInternetBefore<T>(
      {required Future<ResponseResult<T>> Function() onInternetConnected,
      bool withTimeout = true}) async {
    try {
      final result = await checkConnectivity();
      if (result.isNotEmpty) {
        if (withTimeout) {
          return await onInternetConnected().timeout(
            const Duration(seconds: 7),
            onTimeout: () {
              return getNoInternetDomainError<T>();
            },
          );
        } else {
          return await onInternetConnected();
        }
      }
      return getNoInternetDomainError<T>();
    } on HandshakeException {
      // this error typically occurs when we make http request and there is no actual connection
      return getNoInternetDomainError<T>();
    } on http.ClientException {
      return getNoInternetDomainError<T>();
    }
  }
}
