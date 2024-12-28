import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/repo/favorite_repo.dart';
import 'package:equatable/equatable.dart';

import '../../core/ui_state.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo favoriteRepo;

  FavoriteCubit({required this.favoriteRepo})
      : super(const FavoriteState(favoriteProducts: UIState(isLoading: true))) {
    fetchFavoriteProducts();
  }

  void fetchFavoriteProducts() async {
    emit(state.copyWith(products: const UIState(isLoading: true)));
    final response = await favoriteRepo.getFavoriteProducts();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(products: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(products: UIState(error: domainErrorModel)));
      },
    );
  }
}
