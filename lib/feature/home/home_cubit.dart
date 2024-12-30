import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/data/model/category/category_list_response_model.dart';
import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/product/product_list_response_model.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/repo/categoy_repo.dart';
import 'package:delishop/core/data/repo/ga_repo.dart';
import 'package:delishop/core/data/repo/product_repo.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/feature/home/home_list_state.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/data/repo/store_repo.dart';
import '../../core/data/response_result.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final StoreRepo _storeRepo;
  final ProductRepo _productRepo;
  final CategoryRepo _categoryRepo;
  final UserDataRepo _userDataRepo;
  final GARepo _gaRepo;

  HomeCubit({required UserDataRepo userDataRepo,required  GARepo gaRepo, required CategoryRepo categoryRepo,
      required StoreRepo storeRepo, required ProductRepo productRepo})
      : _gaRepo = gaRepo, _userDataRepo = userDataRepo, _categoryRepo = categoryRepo, _productRepo = productRepo, _storeRepo = storeRepo, super(const HomeState(
            storeState: HomeListState<Store>(),
            productState: HomeListState<Product>(),
            categoryState: HomeListState<Category>())) {
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    await Future.wait([
      getAllCategories(),
      getAllStores(),
      getAllProducts(),
    ]);
  }

  Future<void> getAllStores() async {
    emit(
        state.copyWith(storeState: state.storeState.copyWith(isLoading: true)));
    final ResponseResult<StoreListResponseModel> result =
        await _storeRepo.getAllStores();
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            storeState: state.storeState.copyWith(dataList: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            storeState: state.storeState.copyWith(error: domainErrorModel)));
      },
    );
  }

  Future<void> getAllProducts() async {
    emit(state.copyWith(
        productState: state.productState.copyWith(isLoading: true)));
    final ResponseResult<ProductListResponseModel> result =
        await _productRepo.getAllProducts();
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            productState:
                state.productState.copyWith(dataList: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            productState:
                state.productState.copyWith(error: domainErrorModel)));
      },
    );
  }

  Future<void> getAllCategories() async {
    emit(state.copyWith(
        categoryState: state.categoryState.copyWith(isLoading: true)));
    final ResponseResult<CategoryListResponseModel> result =
        await _categoryRepo.getAllCategories();
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(
            categoryState:
                state.categoryState.copyWith(dataList: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            categoryState:
                state.categoryState.copyWith(error: domainErrorModel)));
      },
    );
  }
  void logViewHome() {
    _gaRepo.logViewHome(_userDataRepo.getString(DataAccessKeys.phoneNumberKey) ?? "");
  }
}
