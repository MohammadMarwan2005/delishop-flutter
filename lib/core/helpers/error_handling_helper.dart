import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/api_consts.dart';
import '../data/domain_error_model.dart';
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
    if (isSuccess()) {
      final successModel = jsonToModel(jsonDecode(body));
      return Success(successModel);
    } else {
      final errorModel = DomainErrorModel.fromJson(jsonDecode(body), statusCode);
      return Error(errorModel);
    }
  }
}

extension ErrorHandler on DomainErrorModel {
  T when<T>({
    required T Function() onUnprocessableEntity,
    required T Function() onUnauthorized,
    required T Function() onNoInternet,
    required T Function() onUnknown,
  }) {
    switch (code) {
      case StatusCodes.unprocessableEntity:
        return onUnprocessableEntity();
      case StatusCodes.unauthorized:
        return onUnauthorized();
      case StatusCodes.noInternet:
        return onNoInternet();
      case StatusCodes.unknown:
        return onUnknown();
      default:
        return onUnknown();
    }
  }
}