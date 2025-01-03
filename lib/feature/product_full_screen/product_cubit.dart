import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/db_service.dart';
import 'package:delishop/core/data/model/favorite/favorite_response.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/product_repo.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/repo/favorite_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;
  final StoreRepo _storeRepo;
  final FavoriteRepo _favoriteRepo;
  final Product product;
  final GARepo _gaRepo;
  final UserDataRepo _userDataRepo;
  final DBService _dbService;

  ProductCubit({
    required UserDataRepo userDataRepo,
    required ProductRepo productRepo,
    required StoreRepo storeRepo,
    required FavoriteRepo favoriteRepo,
    required this.product,
    required GARepo gaRepo,
    required DBService dbService,
  })  : _userDataRepo = userDataRepo,
        _productRepo = productRepo,
        _favoriteRepo = favoriteRepo,
        _storeRepo = storeRepo,
        _gaRepo = gaRepo,
        _dbService = dbService,
        super(const ProductState(
            productState: UIState(initial: true),
            storeState: UIState(isLoading: true),
            favoriteState: UIState(isLoading: true), isInCartState: UIState(isLoading: true))) {
    fetchProductAndStore();
  }

  void fetchProductAndStore() async {
    await Future.wait([
      fetchProduct(),
      fetchStore(),
      fetchIsInCart()
    ]);
  }

  Future<void> fetchProduct() async {
    emit(state.copyWith(product: const UIState(isLoading: true)));
    ResponseResult<Product> productResult =
        await _productRepo.getProductById(product.id);
    productResult.when(
      onSuccess: (successData) {
        _gaRepo.logViewProduct(successData,
            _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
        emit(state.copyWith(product: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(product: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> fetchStore() async {
    emit(
      state.copyWith(store: const UIState(isLoading: true)),
    );
    ResponseResult<Store> storeResult =
        await _storeRepo.getStoreById(product.storeId);
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
        await _favoriteRepo.addProductToFavorite(product.id);
    result.when(
      onSuccess: (successData) {
        _gaRepo.logAddToFavorites(product,
            _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
        emit(state.copyWith(
            favoriteState: UIState(data: successData),
            product:
                UIState(data: state.productState.data?.copyWithInvertedFav())));
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
        await _favoriteRepo.removeProductFromFavorite(product.id);
    result.when(
      onSuccess: (successData) {
        _gaRepo.logRemoveFromFavorites(product,
            _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
        emit(state.copyWith(
            favoriteState: UIState(data: successData),
            product:
                UIState(data: state.productState.data?.copyWithInvertedFav())));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(favoriteState: UIState(error: domainErrorModel)));
      },
    );
  }

  void addToCart() {
    _gaRepo.logAddToCart(
        product, _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
  }

  Future<void> reloadEmptyStates() async {
    final List<Future<void>> futures = [];
    if(state.productState.error != null) {
      futures.add(fetchProduct());
    }
    if(state.storeState.error != null) {
      futures.add(fetchStore());
    }
    if(state.isInCartState.error != null) {
      futures.add(fetchStore());
    }
    await Future.wait(futures);
  }

  Future<void> fetchIsInCart() async {
    emit(state.copyWith(isInCartState: const UIState(isLoading: true)));
    final result = await _dbService.isInDatabase(product.id);
    emit(state.copyWith(isInCartState: UIState(data: result)));
  }
}
