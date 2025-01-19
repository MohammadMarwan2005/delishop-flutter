import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:delishop/core/data/repo/auth_repo.dart';
import 'package:delishop/core/helpers/internet_check_helper.dart';

import '../api_service.dart';
import '../model/order/create_order_request/create_order_request.dart';
import '../model/order/order_list/order_list_response.dart';
import '../model/order/order_response/order_response.dart';
import '../response_result.dart';

class OrderRepo {
  final ApiService _apiService;
  final Connectivity _connectivity;

  OrderRepo(this._apiService, this._connectivity);

  Future<ResponseResult<OrderResponse>> createOrder(
      CreateOrderRequest requestModel) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.createOrder(requestModel);
      },
    );
  }

  Future<ResponseResult<OrderListResponse>> getMyOrders() async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getMyOrders();
      },
    );
  }

  Future<ResponseResult<OrderListResponse>> getMyStoreOrders() async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.getMyStoreOrders();
      },
    );
  }

  Future<ResponseResult<OrderResponse>> cancelOrder(int orderId) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.updateOrderStatus(orderId, OrderStatus.cancelled);
      },
    );
  }

  Future<ResponseResult<OrderResponse>> updateOrderStatus(int orderId, OrderStatus orderStatus, {String? message}) async {
    return _connectivity.checkInternetBefore(
      onInternetConnected: () {
        return _apiService.updateOrderStatus(orderId, orderStatus, message: message);
      },
    );
  }
}
