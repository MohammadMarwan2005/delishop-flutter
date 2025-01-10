import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/api_consts.dart';
import '../data/model/domain_error_model.dart';
import '../data/response_result.dart';

extension SuccessHelper on http.Response {
  bool isSuccess() => statusCode >= 200 && statusCode <= 300;

  T toModel<T>(
      {required T Function(Map<String, dynamic> jsonMap) jsonToModel}) {
    return jsonToModel(jsonDecode(body));
  }

  /// the purpose of this function is to decide whether the the response is Successful or not,
  /// if it's done successfully it returns the data as the expected DataModel
  /// otherwise it will return the data as a Domain ErrorModel.
  ResponseResult<T> handle<T>(
      {required T Function(Map<String, dynamic> jsonMap) jsonToModel}) {
    final decodedBody = utf8.decode(bodyBytes);
    if (isSuccess()) {
      final successModel = jsonToModel(jsonDecode(decodedBody));
      return Success(successModel);
    } else {
      final errorModel =
          DomainErrorModel.fromJson(jsonDecode(body), statusCode);
      return Error(errorModel);
    }
  }

  http.Response getDataResponse() {
    if (isSuccess()) {
      // encode the string to handle arabic characters
      final utf8EncodedBody = utf8.encode(jsonEncode(jsonDecode(body)["data"]));

      return http.Response.bytes(utf8EncodedBody, statusCode);
    } else {
      return this;
    }
  }
}

extension ErrorHandler on DomainErrorModel {
  T when<T>({
    required T Function() onUnprocessableEntity,
    required T Function() onUnauthorized,
    required T Function() onNoInternet,
    required T Function() onUnknown,
    T Function()? onConflict,
    T Function()? onNotFound,
  }) {
    switch (code) {
      case StatusCodes.unprocessableEntity:
        return onUnprocessableEntity();
      case StatusCodes.unauthorized:
        return onUnauthorized();
      case StatusCodes.noInternet:
        return onNoInternet();
      case StatusCodes.conflict:
        if (onConflict != null) {
          return onConflict();
        }
        return null as T;
      case StatusCodes.notFound:
        if (onNotFound != null) {
          return onNotFound();
        }
        return null as T;
      case StatusCodes.unknown:
        return onUnknown();
      default:
        return onUnknown();
    }
  }
}
