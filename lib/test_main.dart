import 'package:delishop/core/data/api_service.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final apiService = ApiService(httpClient: http.Client());
  final ResponseResult<AuthResponseModel> result = await apiService.login(
      LoginRequestModel(phoneNumber: "0998146546", password: "Aa@12345"));


  result.when(
    onSuccess: (successData) {
      print('Success 🎉🎉');
      print(successData.toJson().toString());
    },
    onError: (domainErrorModel) {
      print("Failure ❌❌");
      print(domainErrorModel.toString());
      domainErrorModel.when<void>(
        onUnprocessableEntity: () {
          print("PresentationUnprocessableEntity");
        },
        onUnauthorized: () {
          print("Unauthorized: (Wrong Info)");
        },
        onNoInternet: () {
          print("No Internet Connection");
        },
        onUnknown: () {
          print("Unknown Error");
          print(domainErrorModel.details.toString());
        },
      );
    },
  );
}
