part of 'product_cubit.dart';

class ProductState extends Equatable {
  final UIState<Product> productState;
  final UIState<Store> storeState;
  final UIState<FavoriteResponse> favoriteState;
  final UIState<bool> isInCartState;

  const ProductState(
      {required this.productState,
      required this.storeState,
      required this.favoriteState,
      required this.isInCartState});

  @override
  List<Object> get props => [productState, storeState, favoriteState, isInCartState];

  ProductState copyWith({
    UIState<Product>? product,
    UIState<Store>? store,
    UIState<FavoriteResponse>? favoriteState,
    UIState<bool>? isInCartState,
  }) {
    return ProductState(
      productState: product ?? productState,
      storeState: store ?? storeState,
      favoriteState: favoriteState ?? this.favoriteState,
      isInCartState: isInCartState ?? this.isInCartState,
    );
  }
}
