import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/model/location/location.dart';
import '../../../core/data/repo/order_repo.dart';
import '../../../core/ui_state.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;

  OrderCubit(this.orderRepo) : super(const OrderState()) {
    Future.wait([]);
  }

  Future<void> order(OrderEntity orderEntity, Map<int, int> quants,
      Location location, String description) async {
    emit(state.copyWith(createOrderResponse: const UIState(isLoading: true)));
    final httpResponse = await orderRepo.createOrder(orderEntity.toOrder(
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

  Future<void> fetchMyOrders() async {
    emit(state.copyWith(myOrdersResponse: const UIState(isLoading: true)));
    final httpResponse = await orderRepo.getMyOrders();
    httpResponse.when(
      onSuccess: (successData) {
        emit(state.copyWith(myOrdersResponse: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        if(domainErrorModel.code == StatusCodes.notFound) {
          emit(state.copyWith(myOrdersResponse: const UIState(data: [])));
        }
        emit(
            state.copyWith(myOrdersResponse: UIState(error: domainErrorModel)));
      },
    );
  }
}
