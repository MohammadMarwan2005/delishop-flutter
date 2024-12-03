import 'package:delishop/core/data/api_service.dart';
import 'package:delishop/core/data/model/product/product_list_response_model.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'core/data/repo/product_repo.dart';
import 'core/di/di_get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  // runApp(const DelishopApp());

  // final apiService = ApiService(httpClient: http.Client());
  // final ResponseResult<AuthResponseModel> result = await apiService.login(
  //     LoginRequestModel(phoneNumber: "0998146546", password: "Aa@12345"));
  // result.when(
  //   onSuccess: (successData) {
  //     print('Success 🎉🎉');
  //     print(successData.toJson().toString());
  //   },
  //   onError: (domainErrorModel) {
  //     print("Failure ❌❌");
  //     print(domainErrorModel.toString());
  //     domainErrorModel.when<void>(
  //       onUnprocessableEntity: () {
  //         print("PresentationUnprocessableEntity");
  //       },
  //       onUnauthorized: () {
  //         print("Unauthorized: (Wrong Info)");
  //       },
  //       onNoInternet: () {
  //         print("No Internet Connection");
  //       },
  //       onUnknown: () {
  //         print("Unknown Error");
  //         print(domainErrorModel.details.toString());
  //       },
  //     );
  //   },
  // );
  //
  // final ProductRepo productRepo = ProductRepo(apiService: getIt(), connectivity: getIt());
  //
  //
  // final ResponseResult<ProductListResponseModel> productsResult =
  //     await productRepo.getAllProducts();
  // productsResult.when(onSuccess: (successData) {
  //   print('Success 🎉🎉');
  //   print(successData.toJson().toString());
  // }, onError: (domainErrorModel) {
  //   print("Failure ❌❌");
  //   print(domainErrorModel.toString());
  //   domainErrorModel.when<void>(
  //     onUnprocessableEntity: () {
  //       print("PresentationUnprocessableEntity");
  //     },
  //     onUnauthorized: () {
  //       print("Unauthorized: (Wrong Info)");
  //     },
  //     onNoInternet: () {
  //       print("No Internet Connection");
  //     },
  //     onUnknown: () {
  //       print("Unknown Error");
  //       print(domainErrorModel.details.toString());
  //     },
  //   );
  // });
  //

  final StoreRepo productRepo = StoreRepo(apiService: getIt(), connectivity: getIt());


  final ResponseResult<Store> productsResult =
  await productRepo.getStoreById(3);
  productsResult.when(onSuccess: (successData) {
    print('Success 🎉🎉');
    print(successData);
  }, onError: (domainErrorModel) {
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
  });

}
