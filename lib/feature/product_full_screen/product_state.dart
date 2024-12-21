part of 'product_cubit.dart';

class ProductState extends Equatable {
  final UIState<Product> productState;
  final UIState<Store> storeState;
  final UIState<FavoriteResponse> favoriteState;

  const ProductState({required this.productState, required this.storeState, required this.favoriteState});

  @override
  List<Object> get props => [productState, storeState];

  ProductState copyWith({
    UIState<Product>? product,
    UIState<Store>? store,
    UIState<FavoriteResponse>? favoriteState
  }) {
    return ProductState(
        productState: product ?? productState,
        storeState: store ?? storeState,
      favoriteState: favoriteState ?? this.favoriteState,
    );
  }
}
