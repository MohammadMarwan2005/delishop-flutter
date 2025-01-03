part of 'cart_cubit.dart';

class CartState extends Equatable {
  final UIState<List<OrderEntity>> orderEntities;
  final int badgeCount;
  final Map<int, int> productsQuants;

  const CartState(
      {required this.orderEntities,
      this.badgeCount = 0,
      this.productsQuants = const {}});

  @override
  List<Object?> get props => [orderEntities, badgeCount, productsQuants];

  CartState copyWith({
    UIState<List<OrderEntity>>? products,
    int? badgeCount,
    Map<int, int>? productsQuants
  }) {
    return CartState(
        orderEntities: products ?? orderEntities,
        badgeCount: badgeCount ?? this.badgeCount,
      productsQuants: productsQuants ?? this.productsQuants
    );
  }
}
