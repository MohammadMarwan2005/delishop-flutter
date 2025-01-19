import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/store/store.dart';
import '../response_result.dart';

class StoreRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  StoreRepo(
      {required ApiService apiService, required Connectivity connectivity})
      : _apiService = apiService,
        _connectivity = connectivity;

  Future<ResponseResult<StoreListResponseModel>> getAllStores() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getAllStores();
      },
    );
  }

  Future<ResponseResult<StoreListResponseModel>> getStoresByIds(
      List<int> ids) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getStoresByIds(ids);
      },
    );
  }

  Future<ResponseResult<Store>> getStoreById(int id) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getStoreById(id);
      },
    );
  }

  Future<ResponseResult<StoreListResponseModel>> getStoresByCategoryId(
      int categoryId) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getStoresByCategoryId(categoryId);
      },
    );
  }

  Future<ResponseResult<Store>> getMyStore() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getMyStore();
      },
    );
  }

  Future<ResponseResult<Store>> updateMyStore(Store store, File? image) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.updateMyStore(store, image);
      },
    );
  }
}
