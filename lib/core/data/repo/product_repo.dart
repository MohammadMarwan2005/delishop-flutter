import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/product/product.dart';
import '../model/product/product_list_response_model.dart';
import '../response_result.dart';

class ProductRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  ProductRepo(
      {required ApiService apiService, required Connectivity connectivity})
      : _connectivity = connectivity,
        _apiService = apiService;

  Future<ResponseResult<ProductListResponseModel>> getAllProducts() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getAllProducts();
      },
    );
  }

  Future<ResponseResult<Product>> getProductById(int id) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getProductById(id);
      },
    );
  }

  Future<ResponseResult<ProductListResponseModel>> getProductsByStoreId(
      int storeId) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getProductsByStoreId(storeId);
      },
    );
  }

  /// a function for the store role...
  Future<ResponseResult<ProductListResponseModel>> getMyProducts() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getMyProducts();
      },
    );
  }

  Future<ResponseResult<Product>> createProduct(
      Product product, File? image) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.createProduct(product, image);
      },
    );
  }
  Future<ResponseResult<Product>> updateProduct(
      Product product, File? image) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.updateProduct(product, image);
      },
    );
  }
}
