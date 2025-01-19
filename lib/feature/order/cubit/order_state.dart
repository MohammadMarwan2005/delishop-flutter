part of 'order_cubit.dart';

class OrderState extends Equatable {
  final UIState<OrderResponse> createOrderResponse;
  final UIState<OrderResponse> changeOrderStatusResponse;
  final UIState<List<OrderResponse>> myOrdersResponse;
  final UIState<List<OrderHeroModel>> myHeroOrders;

  const OrderState({
    this.createOrderResponse = const UIState(),
    this.changeOrderStatusResponse = const UIState(),
    this.myOrdersResponse = const UIState(),
    this.myHeroOrders = const UIState(isLoading: true),
  });

  OrderState copyWith({
    UIState<OrderResponse>? createOrderResponse,
    UIState<OrderResponse>? deleteOrderResponse,
    UIState<List<OrderResponse>>? myOrdersResponse,
    UIState<List<OrderHeroModel>>? myHeroOrders,
  }) {
    return OrderState(
      createOrderResponse: createOrderResponse ?? this.createOrderResponse,
      changeOrderStatusResponse: deleteOrderResponse ?? this.changeOrderStatusResponse,
      myOrdersResponse: myOrdersResponse ?? this.myOrdersResponse,
      myHeroOrders: myHeroOrders ?? this.myHeroOrders,
    );
  }

  @override
  List<Object?> get props => [
        createOrderResponse,
        changeOrderStatusResponse,
        myOrdersResponse,
        myHeroOrders
      ];
}
