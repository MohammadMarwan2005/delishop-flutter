part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  final UIState<List<Product>> favoriteProducts;

  const FavoriteState({required this.favoriteProducts});

  @override
  List<Object?> get props => [favoriteProducts];


  FavoriteState copyWith({
    UIState<List<Product>>? products,
  }) {
    return FavoriteState(favoriteProducts : products?? favoriteProducts);
  }
}