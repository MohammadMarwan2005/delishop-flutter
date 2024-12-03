part of 'home_cubit.dart';

class HomeState extends Equatable {
  final HomeListState<Store> storeState;
  final HomeListState<Product> productState;
  final HomeListState<Category> categoryState;

  const HomeState(
      {required this.categoryState,
      required this.storeState,
      required this.productState});

  @override
  List<Object?> get props => [storeState, productState, categoryState];

  HomeState copyWith({
    HomeListState<Store>? storeState,
    HomeListState<Product>? productState,
    HomeListState<Category>? categoryState,
  }) {
    return HomeState(
      storeState: storeState ?? this.storeState,
      productState: productState ?? this.productState,
      categoryState: categoryState ?? this.categoryState,
    );
  }
}
