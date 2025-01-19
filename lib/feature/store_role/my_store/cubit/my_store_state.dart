part of 'my_store_cubit.dart';

class MyStoreState extends Equatable {
  final UIState<Store> myStore;
  final File? storeUploadedImage;
  final UIState<List<Category>> categories;
  final int? selectedCategoryIndex;

  const MyStoreState({
    this.selectedCategoryIndex,
    this.myStore = const UIState(isLoading: true),
    this.categories = const UIState(isLoading: true),
    this.storeUploadedImage,
  });

  @override
  List<Object?> get props =>
      [myStore, storeUploadedImage, selectedCategoryIndex, categories];

  MyStoreState copyWith({
    UIState<Store>? myStore,
    File? storeUploadedImage,
    int? selectedCategoryIndex,
    UIState<List<Category>>? categories,
  }) {
    return MyStoreState(
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      myStore: myStore ?? this.myStore,
      storeUploadedImage: storeUploadedImage ?? this.storeUploadedImage,
      categories: categories ?? this.categories,
    );
  }

  MyStoreState withoutImage() {
    return MyStoreState(
        myStore: myStore,
        storeUploadedImage: null,
        selectedCategoryIndex: selectedCategoryIndex,
        categories: categories);
  }
}
