part of 'store_cubit.dart';

class StoreState extends Equatable {
  final UIState<List<Product>> productsState;
  final UIState<Store> storeState;

  const StoreState({required this.productsState, required this.storeState});

  @override
  List<Object?> get props => [productsState, storeState];

  StoreState copyWith({
    UIState<List<Product>>? products,
    UIState<Store>? store,
  }) {
    return StoreState(
      productsState: products ?? productsState,
      storeState: store ?? storeState,
    );
  }
}
