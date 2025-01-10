import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/search/search_response.dart';
import '../response_result.dart';

class SearchRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  SearchRepo(this._apiService, this._connectivity);

  Future<ResponseResult<SearchResponse>> search(
      {int? categoryId, String keyWord = ""}) {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.search(categoryId: categoryId, keyWord: keyWord);
      },
    );
  }
}