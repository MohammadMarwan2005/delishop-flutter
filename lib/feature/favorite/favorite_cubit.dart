import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/repo/favorite_repo.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:equatable/equatable.dart';

import '../../core/ui_state.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;
  final GARepo _gaRepo;
  final UserDataRepo _userDataRepo;

  FavoriteCubit(
      {required GARepo gaRepo,
      required UserDataRepo userDataRepo,
      required FavoriteRepo favoriteRepo})
      : _userDataRepo = userDataRepo,
        _gaRepo = gaRepo,
        _favoriteRepo = favoriteRepo,
        super(const FavoriteState(favoriteProducts: UIState(isLoading: true))) {
    fetchFavoriteProducts();
  }

  void fetchFavoriteProducts() async {
    emit(state.copyWith(products: const UIState(isLoading: true)));
    final response = await _favoriteRepo.getFavoriteProducts();
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(products: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(products: UIState(error: domainErrorModel)));
      },
    );
  }

  void logViewFav() {
    _gaRepo.logViewFavorites(
        _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
  }
}
