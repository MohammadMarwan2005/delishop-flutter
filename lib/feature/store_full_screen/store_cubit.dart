import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/product/product_list_response_model.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/model/product/product.dart';
import '../../core/data/model/store/store.dart';
import '../../core/data/repo/product_repo.dart';
import '../../core/data/repo/store_repo.dart';
import '../../core/data/response_result.dart';
import '../../core/ui_state.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final ProductRepo productRepo;
  final StoreRepo storeRepo;
  final int storeId;

  StoreCubit(
      {required this.productRepo,
      required this.storeRepo,
      required this.storeId})
      : super(const StoreState(
            productsState: UIState(isLoading: true),
            storeState: UIState(isLoading: true))) {
    fetchStoreAndItsProducts();
  }

  void fetchStoreAndItsProducts() async {
    await Future.wait([
      fetchStore(),
      fetchStoreProducts(),
    ]);
  }

  Future<void> fetchStore() async {
    emit(state.copyWith(
        store: const UIState(isLoading: true)));

    ResponseResult<Store> storeResult = await storeRepo.getStoreById(storeId);
    storeResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(store: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(store: UIState(error: domainErrorModel)));
      },
    );
  }

  Future<void> fetchStoreProducts() async {
    emit(state.copyWith(
        products: const UIState(
          isLoading: true,
        ),
        store: const UIState(isLoading: true)));
    ResponseResult<ProductListResponseModel> productsResult =
    await productRepo.getProductsByStoreId(storeId);

    productsResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(products: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(products: UIState(error: domainErrorModel)));
      },
    );
  }
}
