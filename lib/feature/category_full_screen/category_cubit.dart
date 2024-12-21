import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/data/model/store/store_list_response_model.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:equatable/equatable.dart';

import '../../core/data/model/store/store.dart';
import '../../core/data/repo/store_repo.dart';
import '../../core/ui_state.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final StoreRepo storeRepo;
  final Category category;

  CategoryCubit({required this.storeRepo, required this.category})
      : super(const CategoryState(storesState: UIState(isLoading: true))) {
    fetchAllStores();
  }

  void fetchAllStores() async {
    emit(state.copyWith(stores: const UIState(isLoading: true)));
    final ResponseResult<StoreListResponseModel> result =
        await storeRepo.getStoresByCategoryId(category.id);

    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(stores: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(stores: UIState(error: domainErrorModel)));
      },
    );
  }
}
