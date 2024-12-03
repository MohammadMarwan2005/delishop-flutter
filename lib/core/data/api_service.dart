import 'dart:convert';

import 'package:delishop/core/data/model/category/category_list_response_model.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';
import 'package:delishop/feature/auth/model/register_request_model.dart';
import 'package:http/http.dart' as http;

import 'api_consts.dart';
import 'model/product/product_list_response_model.dart';
import 'model/store/store.dart';

class ApiService {
  final http.Client _httpClient;

  ApiService({required http.Client httpClient}) : _httpClient = httpClient;

  Future<ResponseResult<AuthResponseModel>> login(
      LoginRequestModel body) async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.loginUrl),
      headers: CommonConsts.acceptJsonHeader,
      body: jsonEncode(body.toJson()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<AuthResponseModel>> register(
      RegisterRequestModel body) async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.registerUrl),
      headers: CommonConsts.acceptJsonHeader,
      body: jsonEncode(body.toJson()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<ProductListResponseModel>> getAllProducts() async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.productSearchUrl),
      headers: CommonConsts.acceptJsonHeader,
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return ProductListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<Product>> getProductById(int id) async {
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse("${ApiConsts.getProductByIdUrl}/$id"),
          headers: CommonConsts.acceptJsonHeader,
        )
        .then((value) => value.getDataResponse());
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return Product.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<StoreListResponseModel>> getAllStores() async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.storeSearchUrl),
      headers: CommonConsts.acceptJsonHeader,
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return StoreListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<Store>> getStoreById(int id) async {
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse("${ApiConsts.getStoreByIdUrl}/$id"),
          headers: CommonConsts.acceptJsonHeader,
        )
        .then((value) => value.getDataResponse());
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return Store.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<CategoryListResponseModel>> getAllCategories() async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getAllCategories),
      headers: CommonConsts.acceptJsonHeader,
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return CategoryListResponseModel.fromJson(jsonMap);
    });
  }
}
