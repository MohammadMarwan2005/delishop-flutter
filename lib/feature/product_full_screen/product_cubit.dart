import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/api_service.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/repo/product_repo.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  final StoreRepo storeRepo;
  final Product product;

  ProductCubit(
      {required this.productRepo,
      required this.storeRepo,
      required this.product})
      : super(const ProductState(
          productState: UIState(isLoading: true),
          storeState: UIState(isLoading: true),
        )) {
    fetchProductAndStore();
  }

  void fetchProductAndStore() async {
    emit(
      state.copyWith(
          product: const UIState(isLoading: true),
          store: const UIState(isLoading: true)),
    );
    ResponseResult<Product> productResult = await productRepo.getProductById(product.id);
    productResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(product: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(product: UIState(error: domainErrorModel)));
      },
    );
    ResponseResult<Store> storeResult = await storeRepo.getStoreById(product.storeId);
    storeResult.when(
      onSuccess: (successData) {
        emit(state.copyWith(store: UIState(data: successData)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(store: UIState(error: domainErrorModel)));
      },
    );
  }
}
