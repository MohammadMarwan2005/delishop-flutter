import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/product/product_list_response_model.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/model/product/product.dart';
import '../../core/data/model/store/store.dart';
import '../../core/data/repo/product_repo.dart';
import '../../core/data/repo/store_repo.dart';
import '../../core/data/response_result.dart';
import '../../core/ui_state.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final ProductRepo _productRepo;
  final StoreRepo _storeRepo;
  final GARepo _gaRepo;
  final UserDataRepo _userDataRepo;
  final int storeId;

  StoreCubit(
      {required ProductRepo productRepo,
      required StoreRepo storeRepo,
      required UserDataRepo userDataRepo,
      required GARepo gaRepo,
      required this.storeId})
      : _gaRepo = gaRepo,
        _storeRepo = storeRepo,
        _productRepo = productRepo,
  _userDataRepo = userDataRepo,
        super(const StoreState(
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
    emit(state.copyWith(store: const UIState(isLoading: true)));

    ResponseResult<Store> storeResult = await _storeRepo.getStoreById(storeId);
    storeResult.when(
      onSuccess: (successData) {
        _gaRepo.logViewStore(successData, _userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
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
        await _productRepo.getProductsByStoreId(storeId);

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
