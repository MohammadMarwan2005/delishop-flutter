part of 'order_cubit.dart';

class OrderState extends Equatable {
  final UIState<OrderResponse> createOrderResponse;
  final UIState<List<OrderResponse>> myOrdersResponse;

  const OrderState({
    this.createOrderResponse = const UIState(),
    this.myOrdersResponse = const UIState(),
  });

  OrderState copyWith({
    UIState<OrderResponse>? createOrderResponse,
    UIState<List<OrderResponse>>? myOrdersResponse,
  }) {
    return OrderState(
      createOrderResponse: createOrderResponse ?? this.createOrderResponse,
      myOrdersResponse: myOrdersResponse ?? this.myOrdersResponse,
    );
  }

  @override
  List<Object?> get props => [createOrderResponse, myOrdersResponse];
}
