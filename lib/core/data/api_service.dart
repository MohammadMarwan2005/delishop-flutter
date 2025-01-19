import 'dart:convert';
import 'dart:io';

import 'package:delishop/core/data/model/category/category_list_response_model.dart';
import 'package:delishop/core/data/model/favorite/favorite_response.dart';
import 'package:delishop/core/data/model/location/location.dart';
import 'package:delishop/core/data/model/order/create_order_request/create_order_request.dart';
import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/profile/profile.dart';
import 'package:delishop/core/data/model/search/search_response.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/model/transaction/transaction_list_response.dart';
import 'package:delishop/core/data/model/user/user.dart';
import 'package:delishop/core/data/model/wallet/deposit_money_request.dart';
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
    print(httpResponse.body);
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

  Future<ResponseResult<Store>> getMyStore() async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse(ApiConsts.getMyStoreUrl),
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
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return WalletBalanceResponse.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<WalletBalanceResponse>> depositMoney(
      DepositMoneyRequest request) async {
    final token = await _userDataRepo.getToken();
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.depositMoneyUrl),
            headers: CommonConsts.getTokenHeader(token),
            body: jsonEncode(request.toJson()))
        .then((value) => value.getDataResponse());
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return WalletBalanceResponse.fromJson(jsonMap);
    });
  }

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

  Future<ResponseResult<OrderListResponse>> getMyStoreOrders() async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getMyStoreOrdersUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return OrderListResponse.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<OrderResponse>> updateOrderStatus(
      int orderId, OrderStatus newStatus,
      {String? message}) async {
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.updateOrder),
            headers:
                CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
            body: jsonEncode({
              "order_id": orderId,
              "status": newStatus.stringValue,
              "message": message
            }))
        .then((value) => value.getDataResponse());
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return OrderResponse.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<SearchResponse>> search(
      {required int? categoryId, required String keyWord}) async {
    final http.Response httpResponse = await _httpClient
        .post(Uri.parse(ApiConsts.searchUrl),
            headers:
                CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
            body: jsonEncode({"category_id": categoryId, "keyword": keyWord}))
        .then((value) => value.getDataResponse());
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return SearchResponse.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<Profile>> getProfile() async {
    final http.Response httpResponse = await _httpClient
        .get(
          ApiConsts.getProfileUrl.getUri(),
          headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
        )
        .then((value) => value.getDataResponse());
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return Profile.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<AuthResponseModel>> createUser(User user) async {
    final http.Response httpResponse = await _httpClient.post(
      Uri.parse(ApiConsts.createUserUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
      body: jsonEncode(user.toJson()),
    );
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return AuthResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<TransactionListResponse>> getTransactions() async {
    final http.Response httpResponse = await _httpClient.get(
        Uri.parse(ApiConsts.getTransactionsUrl),
        headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()));
    print(httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return TransactionListResponse.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<ProductListResponseModel>> getMyProducts() async {
    final http.Response httpResponse = await _httpClient.get(
      Uri.parse(ApiConsts.getMyProductsUrl),
      headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
    );
    print("getMyProducts" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return ProductListResponseModel.fromJson(jsonMap);
    });
  }

  Future<ResponseResult<int>> getUnreadNotificationsCount() async {
    final http.Response httpResponse = await _httpClient
        .get(
          Uri.parse(ApiConsts.getUnreadNotificationsCount),
          headers: CommonConsts.getTokenHeader(await _userDataRepo.getToken()),
        )
        .then((value) => value.getDataResponse());
    print("getUnreadNotificationsCount" + httpResponse.body);
    return httpResponse.handle(jsonToModel: (jsonMap) {
      return jsonMap["count"];
    });
  }

  Future<ResponseResult<Profile>> updateProfile(
      Profile profile, File? image) async {
    return await updateWithImage(
      url: ApiConsts.updateProfileUrl.getUri(),
      body: profile.toJson(),
      imageKey: "profile_picture",
      image: image,
      token: await _userDataRepo.getToken(),
      jsonToModel: (jsonMap) {
        return Profile.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<Product>> createProduct(
      Product product, File? image) async {
    return await updateWithImage(
      url: ApiConsts.createProductUrl.getUri(),
      body: product.toJson(),
      imageKey: "product_picture",
      image: image,
      token: await _userDataRepo.getToken(),
      jsonToModel: (jsonMap) {
        return Product.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<Product>> updateProduct(
      Product product, File? image) async {
    return await updateWithImage(
      url: ApiConsts.updateProductUrl.getUri(),
      body: product.toJson()
        ..remove('id')
        ..['product_id'] = product.id,
      imageKey: "product_picture",
      image: image,
      token: await _userDataRepo.getToken(),
      jsonToModel: (jsonMap) {
        return Product.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<Store>> updateMyStore(Store store, File? image) async {
    return await updateWithImage(
      url: ApiConsts.updateMyStoreUrl.getUri(),
      body: store.toJson(),
      imageKey: "store_picture",
      image: image,
      token: await _userDataRepo.getToken(),
      jsonToModel: (jsonMap) {
        return Store.fromJson(jsonMap);
      },
    );
  }

  Future<ResponseResult<T>> updateWithImage<T>(
      {required Uri url,
      required Map<String, dynamic> body,
      required String imageKey,
      required File? image,
      required String token,
      required T Function(Map<String, dynamic> jsonMap) jsonToModel}) async {
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    body.remove(imageKey);
    print("currentMap" + body.toString());
    final bodyWithoutImageKey =
        body.map((key, value) => MapEntry(key, value.toString()));

    request.fields.addAll(bodyWithoutImageKey);
    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          imageKey,
          image.path,
        ),
      );
    }

    final streamedResponse = await request.send();
    final httpResponse = await http.Response.fromStream(streamedResponse)
        .then((value) => value.getDataResponse());
    print(httpResponse.body);
    return httpResponse.handle(
      jsonToModel: (jsonMap) {
        return jsonToModel(jsonMap);
      },
    );
  }
}
