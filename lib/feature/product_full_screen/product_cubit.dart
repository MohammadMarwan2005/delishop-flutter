import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/favorite/favorite_response.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/repo/product_repo.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/repo/favorite_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  final StoreRepo storeRepo;
  final FavoriteRepo favoriteRepo;
  final Product product;

  ProductCubit({
    required this.productRepo,
    required this.storeRepo,
    required this.favoriteRepo,
    required this.product,
  }) : super(const ProductState(
            productState: UIState(initial: true),
            storeState: UIState(isLoading: true),
            favoriteState: UIState(isLoading: true))) {
    fetchProductAndStore();
  }

  void fetchProductAndStore() async {
    emit(
      state.copyWith(
          product: const UIState(isLoading: true),
          store: const UIState(isLoading: true)),
    );
    ResponseResult<Product> productResult =
        await productRepo.getProductById(product.id);
    productResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(product: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(product: UIState(error: domainErrorModel)));
      },
    );
    ResponseResult<Store> storeResult =
        await storeRepo.getStoreById(product.storeId);
    storeResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(store: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(store: UIState(error: domainErrorModel)));
      },
    );
  }

  void addToFavorite() async {
    emit(state.copyWith(
        favoriteState: const UIState(initial: null, isLoading: true)));
    ResponseResult<FavoriteResponse> result =
        await favoriteRepo.addProductToFavorite(product.id);
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(favoriteState: UIState(data: successData), product: UIState(data: state.productState.data?.copyWithInvertedFav())));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(favoriteState: UIState(error: domainErrorModel)));
      },
    );
  }
  void removeFromFavorite() async {
    emit(state.copyWith(
        favoriteState: const UIState(initial: null, isLoading: true)));
    ResponseResult<FavoriteResponse> result =
        await favoriteRepo.removeProductFromFavorite(product.id);
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(favoriteState: UIState(data: successData), product: UIState(data: state.productState.data?.copyWithInvertedFav())));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(favoriteState: UIState(error: domainErrorModel)));
      },
    );
  }

}
