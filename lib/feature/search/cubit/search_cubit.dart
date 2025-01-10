import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/data/repo/search_repo.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:delishop/feature/search/cubit/search_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/data/model/category/category_list_response_model.dart';
import '../../../core/data/repo/categoy_repo.dart';
import '../../../core/data/response_result.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  final CategoryRepo _categoryRepo;
  TextEditingController searchController = TextEditingController();

  SearchCubit(this._searchRepo, this._categoryRepo)
      : super(const SearchState()) {
    Future.wait([getAllCategories()]);
  }

  Future<void> getAllCategories() async {
    emit(
        state.copyWith(categories: state.categories.copyWith(isLoading: true)));
    final ResponseResult<CategoryListResponseModel> result =
        await _categoryRepo.getAllCategories();
    result.when(
      onSuccess: (successData) {
        emit(state.copyWith(categories: UIState(data: successData.data)));
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            categories: state.categories.copyWith(error: domainErrorModel)));
      },
    );
  }

  Future<void> search() async {
    if (state.categories.data != null) {
      emit(state.copyWith(searchResult: const UIState(isLoading: true)));
      int? index = state.selectedCategoryIndex;
      List<Category> categories = state.categories.data!;
      int? categoryId = (index != -1 && index != null) ? categories[index].id : null;
      final response = await _searchRepo.search(
        categoryId: categoryId,
        keyWord: searchController.text,
      );
      response.when(
        onSuccess: (successData) {
          emit(state.copyWith(
            searchResult: UIState(data: successData)
          ));
        },
        onError: (domainErrorModel) {
          emit(state.copyWith(
            searchResult: UIState(error: domainErrorModel)
          ));
        },
      );
    } else {
      getAllCategories();
    }
  }

  void onCategorySelected(int? index) {
    emit(state.copyWith(selectedCategoryIndex: index));
    search();
  }

  Future<void> reloadAll() async {
    Future.wait([
      search(),
    ]);
  }


  String getProductsOrStoresFoundForThisKeywordInThisCategory(BuildContext context) {
    final first = "${"No products or stores found for the keyword".tr(context)} ${searchController.text}";
    int? index = state.selectedCategoryIndex;
    List<Category> categories = state.categories.data!;
    Category? category = (index != -1 && index != null) ? categories[index] : null;
    final result = (category != null) ? " ${"in category".tr(context)} ${category.name}" : "";
    return first + result;
  }
}
