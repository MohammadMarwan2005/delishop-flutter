import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/model/category/category_list_response_model.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../response_result.dart';

class CategoryRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  CategoryRepo({required ApiService apiService, required Connectivity connectivity}) : _apiService = apiService, _connectivity = connectivity;

  Future<ResponseResult<CategoryListResponseModel>> getAllCategories() async {
    return await _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getAllCategories();
      },
    );
  }

  // todo: getCategoryById()
}