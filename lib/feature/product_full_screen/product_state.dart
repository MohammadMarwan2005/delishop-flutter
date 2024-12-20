part of 'product_cubit.dart';

class ProductState extends Equatable {
  final UIState<Product> productState;
  final UIState<Store> storeState;

  const ProductState({required this.productState, required this.storeState});

  @override
  List<Object> get props => [productState, storeState];

  ProductState copyWith({
    UIState<Product>? product,
    UIState<Store>? store,
  }) {
    return ProductState(productState: product ?? productState,
        storeState: store ?? storeState);
  }
}
