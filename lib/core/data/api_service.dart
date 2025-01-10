import 'dart:convert';

import 'package:delishop/core/data/model/category/category_list_response_model.dart';
import 'package:delishop/core/data/model/favorite/favorite_response.dart';
import 'package:delishop/core/data/model/location/location.dart';
import 'package:delishop/core/data/model/order/create_order_request/create_order_request.dart';
import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/search/search_response.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/model/wallet/wallet_balance_response.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/feature/auth/model/auth_response_model.dart';
import 'package:delishop/feature/auth/model/login_request_model.dart';
import 'package:delishop/feature/auth/model/register_request_model.dart';
import 'package:http/http.dart' as http;

import 'api_consts.dart';
import 'model/location/location_list_response_model.dart';
import 'model/order/order_list/order_list_response.dart';
import 'model/product/product_list_response_model.dart';
import 'model/store/store.dart';

class ApiService {
  final UserDataRepo _userDataRepo;
  final http.Client _httpClient;

  ApiService(
      {required UserDataRepo userDataRepo, required http.Client httpClient})
      : _userDataRepo = userDataRepo,
        _httpClient = httpClient;

  Future<ResponseResult<AuthResponseModel>> login(
      LoginRequestModel body) async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.loginUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
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
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
      body: jsonEncode(body.toJson()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<ProductListResponseModel>> getAllProducts() async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.productSearchUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    print("getAllProducts" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return ProductListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<Product>> getProductById(int id) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse("${ApiConsts.getProductByIdUrl}/$id"),
          headers: CommonConsts.getTokenHeader(token),
        )
        .then((value) => value.getDataResponse());
    print("getProductById" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return Product.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<ProductListResponseModel>> getProductsByStoreId(
      int storeId) async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse("${ApiConsts.getProductsByStoreIdUrl}/$storeId"),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    print("getProductByStoreId" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return ProductListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<StoreListResponseModel>> getAllStores() async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.storeSearchUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return StoreListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<StoreListResponseModel>> getStoresByIds(
      List<int> ids) async {
    final http.Response httpResponse = await _httpClient.post(
        Uri.parse(ApiConsts.getStoresByIds),
        headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
        body: jsonEncode({
          'store_ids': ids,
        }));
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return StoreListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<Store>> getStoreById(int id) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse("${ApiConsts.getStoreByIdUrl}/$id"),
          headers: CommonConsts.getTokenHeader(token),
        )
        .then((value) => value.getDataResponse());
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return Store.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<StoreListResponseModel>> getStoresByCategoryId(
      int categoryId) async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse("${ApiConsts.getStoresByCategoryId}/$categoryId"),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return StoreListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<CategoryListResponseModel>> getAllCategories() async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getAllCategories),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return CategoryListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<FavoriteResponse>> addProductToFavorite(
      int productId) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient.post(
        Uri.parse(ApiConsts.addProductToFavoriteUrl),
        body: jsonEncode({'product_id': productId}),
        headers: CommonConsts.getTokenHeader(token));
    return httpResponse.handle(
      jsonToModel: (jsonMap) => FavoriteResponse.fromJson(jsonMap),
    );
  }

  Future<ResponseResult<FavoriteResponse>> removeProductFromFavorite(
      int productId) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient.delete(
        Uri.parse("${ApiConsts.removeProductFromFavoriteUrl}/$productId"),
        headers: CommonConsts.getTokenHeader(token));

    return httpResponse.handle(
      jsonToModel: (jsonMap) => FavoriteResponse.fromJson(jsonMap),
    );
  }

  Future<ResponseResult<ProductListResponseModel>> getFavoriteProducts() async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getFavoriteProductsUrl),
      headers: CommonConsts.getTokenHeader(token),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return ProductListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<WalletBalanceResponse>> getMyBalance() async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse(ApiConsts.getMyBalanceUrl),
          headers: CommonConsts.getTokenHeader(token),
        )
        .then((value) => value.getDataResponse());
    print("getProductByStoreId" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return WalletBalanceResponse.fromJson(jsonMap);
    });
  }

  // locations: List<Location> get, getDefaultLocation, add, delete
  Future<ResponseResult<Location>> getDefaultLocation() async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse(ApiConsts.getDefaultLocation),
          headers: CommonConsts.getTokenHeader(token),
        )
        .then((value) => value.getDataResponse());
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return Location.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<Location>> addNewLocation(Location location) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .post(
          Uri.parse(ApiConsts.addLocation),
          headers: CommonConsts.getTokenHeader(token),
          body: jsonEncode(location.toJson()),
        )
        .then(
          (value) => value.getDataResponse(),
        );
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return Location.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<Location>> deleteLocation(int locationId) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .delete(
          Uri.parse("${ApiConsts.deleteLocation}/$locationId"),
          headers: CommonConsts.getTokenHeader(token),
        )
        .then(
          (value) => value.getDataResponse(),
        );
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return Location.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<LocationListResponseModel>> getUserLocations() async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getUserLocations),
      headers: CommonConsts.getTokenHeader(token),
    );
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return LocationListResponseModel.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<OrderResponse>> createOrder(
      CreateOrderRequest requestModel) async {
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.createOrder),
            headers:
                CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
            body: utf8.encode(jsonEncode(requestModel.toJson())))
        .then((value) => value.getDataResponse());
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return OrderResponse.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<OrderListResponse>> getMyOrders() async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getMyOrdersUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return OrderListResponse.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<int>> updateOrderStatus(
      int orderId, OrderStatus newStatus) async {
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.updateOrder),
            headers:
                CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
            body: jsonEncode(
                {"order_id": orderId, "status": newStatus.stringValue}))
        .then((value) => value.getDataResponse());
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return jsonMap["id"];
      },
    );
  }

  Future<ResponseResult<SearchResponse>> search(
      {required int? categoryId, required String keyWord}) async {
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.searchUrl),
            headers:
                CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
            body: jsonEncode(
                {"category_id": categoryId, "keyword": keyWord}))
        .then((value) => value.getDataResponse());
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return SearchResponse.fromJson(jsonMap);
      },
    );
  }
}

// Failed...
extension HttpHelper on http.Client {
  Future<http.Response> postEncoded(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    return post(url, headers: headers, body: body, encoding: utf8);
  }
}
