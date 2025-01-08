part of 'cart_cubit.dart';

class CartState extends Equatable {
  final UIState<List<OrderEntity>> orderEntities;
  final int badgeCount;
  final Map<int, int> productsQuants;
  final UIState<double> currentBalance;

  const CartState(
      {required this.orderEntities,
      this.badgeCount = 0,
      this.productsQuants = const {},
      required this.currentBalance});

  @override
  List<Object?> get props => [orderEntities, badgeCount, productsQuants, currentBalance];

  CartState copyWith(
      {UIState<List<OrderEntity>>? products,
      int? badgeCount,
      Map<int, int>? productsQuants,
      UIState<double>? currentBalance}) {
    return CartState(
        orderEntities: products ?? orderEntities,
        badgeCount: badgeCount ?? this.badgeCount,
        productsQuants: productsQuants ?? this.productsQuants,
        currentBalance: currentBalance ?? this.currentBalance);
  }
}
