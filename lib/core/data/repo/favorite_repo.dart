import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/model/favorite/favorite_response.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/store/store_list_response_model.dart';
import '../response_result.dart';

class FavoriteRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  FavoriteRepo(
      {required ApiService apiService, required Connectivity connectivity})
      : _apiService = apiService,
        _connectivity = connectivity;

  Future<ResponseResult<FavoriteResponse>> addProductToFavorite(
      int productId) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.addProductToFavorite(productId);
      },
    );
  }

  Future<ResponseResult<FavoriteResponse>> removeProductFromFavorite(
      int productId) async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.removeProductFromFavorite(productId);
      },
    );
  }

}
