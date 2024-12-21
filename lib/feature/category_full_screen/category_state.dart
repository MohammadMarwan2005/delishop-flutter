part of 'category_cubit.dart';

class CategoryState extends Equatable {
  final UIState<List<Store>> storesState;

  const CategoryState({required this.storesState});

  @override
  List<Object?> get props => [storesState];

  CategoryState copyWith({
    UIState<List<Store>>? stores,
  }) {
    return CategoryState(
      storesState: stores ?? storesState,
    );
  }
}
