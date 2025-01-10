import 'package:delishop/core/data/model/search/search_response.dart';
import 'package:equatable/equatable.dart';
import '../../../core/data/model/category/category.dart';
import '../../../core/ui_state.dart';

class SearchState extends Equatable {
  final UIState<List<Category>> categories;
  final UIState<SearchResponse> searchResult;
  final int? selectedCategoryIndex;

  const SearchState({
    this.categories = const UIState(isLoading: true),
    this.searchResult = const UIState(initial: true),
    this.selectedCategoryIndex
  });

  SearchState copyWith({
    UIState<List<Category>>? categories,
    UIState<SearchResponse>? searchResult,
    int? selectedCategoryIndex,
  }) {
    return SearchState(
      categories: categories ?? this.categories,
      searchResult: searchResult ?? this.searchResult,
      selectedCategoryIndex: selectedCategoryIndex ?? ((selectedCategoryIndex == -1) ? null : this.selectedCategoryIndex)
    );
  }

  @override
  List<Object?> get props => [categories, searchResult, selectedCategoryIndex];
}