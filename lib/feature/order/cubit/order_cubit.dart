import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';
import 'package:delishop/feature/order/order_hero_model.dart';
import 'package:delishop/feature/order/order_response_to_order_entity_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/model/location/location.dart';
import '../../../core/data/repo/order_repo.dart';
import '../../../core/ui_state.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo _orderRepo;
  final UserDataRepo _userDataRepo;

  OrderCubit(this._orderRepo, this._userDataRepo) : super(const OrderState()) {
    Future.wait([fetchAll()]);
  }

  Future<void> order(OrderEntity orderEntity, Map<int, int> quants,
      Location location, String description) async {
    emit(state.copyWith(createOrderResponse: const UIState(isLoading: true)));
    final httpResponse = await _orderRepo.createOrder(orderEntity.toOrder(
        quants, location, (description.isNotEmpty) ? description : "-"));

    httpResponse.when(
      onSuccess: (successData) {
        emit(state.copyWith(createOrderResponse: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            createOrderResponse: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> _fetchMyOrders({bool withLoading = true}) async {
    if (withLoading) {
      emit(state.copyWith(myOrdersResponse: const UIState(isLoading: true)));
    }

    final httpResponse = (isUser())
        ? await _orderRepo.getMyOrders()
        : await _orderRepo.getMyStoreOrders();
    httpResponse.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            myOrdersResponse:
                UIState(data: successData.data.reversed.toList())));
      },
      onError: (domainErrorModel) {
        if (domainErrorModel.code == StatusCodes.notFound) {
          emit(state.copyWith(myOrdersResponse: const UIState(data: [])));
        } else {
          emit(state.copyWith(
              myOrdersResponse: UIState(error: domainErrorModel)));
        }
      },
    );
  }

  Future<void> cancelOrder(int orderId) async {
    emit(state.copyWith(deleteOrderResponse: const UIState(isLoading: true)));
    final httpResponse = await _orderRepo.cancelOrder(orderId);
    httpResponse.when(
      onSuccess: (successData) {
        emit(state.copyWith(deleteOrderResponse: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            deleteOrderResponse: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> changeOrderStatus(int orderId, OrderStatus orderStatus, {String? message}) async {
    emit(state.copyWith(deleteOrderResponse: const UIState(isLoading: true)));
    final httpResponse = await _orderRepo.updateOrderStatus(orderId, orderStatus, message: message);
    httpResponse.when(
      onSuccess: (successData) {
        emit(state.copyWith(deleteOrderResponse: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            deleteOrderResponse: UIState(error: domainErrorModel)));
      },
    );
  }


  bool isUser() {
    final roleId = _userDataRepo.getInt(DataAccessKeys.roleIdKey) ?? RoleIds.user;
    return roleId == RoleIds.user;
  }

  Future<void> fetchAll() async {
    await _fetchMyOrders();
  }

  Future<void> waitAndFetchAll() async {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        fetchAll();
      },
    );
  }

  Future<void> fetchAllWithoutLoading() async {
    await _fetchMyOrders(withLoading: false);
  }
}
