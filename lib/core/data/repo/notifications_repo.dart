import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/api_service.dart';

import '../response_result.dart';

class NotificationsRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  const NotificationsRepo(this._apiService, this._connectivity);

  Future<ResponseResult<int>> getUnreadNotificationsCount() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return const Success(5);
    },);
    // return await _connectivity.checkInternetBefore(
    //   onInternetConnected: () {
    //     return _apiService.getUnreadNotificationsCount();
    //   },
    // );
  }
}
