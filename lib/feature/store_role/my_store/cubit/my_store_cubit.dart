import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/data/repo/categoy_repo.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/model/category/category.dart';
import '../../../../core/data/model/category/category_list_response_model.dart';
import '../../../../core/data/response_result.dart';

part 'my_store_state.dart';

class MyStoreCubit extends Cubit<MyStoreState> {
  final StoreRepo _storeRepo;
  final CategoryRepo _categoryRepo;
  final ImagePicker _imagePicker;

  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationNameController = TextEditingController();
  final TextEditingController locationUrlController = TextEditingController();

  MyStoreCubit(this._categoryRepo, this._storeRepo, this._imagePicker)
      : super(const MyStoreState()) {
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    Future.wait([fetchMyStore(), fetchAllCategories()]);
  }

  Future<void> pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    print('pickedImage != null: ${pickedImage != null}');
    if (pickedImage != null) {
      emit(state.copyWith(storeUploadedImage: File(pickedImage.path)));
    }
  }

  Future<void> fetchMyStore() async {
    if (state.categories.data == null) {
      await fetchAllCategories();
    }
    if (state.categories.data != null) {
      emit(state.copyWith(myStore: const UIState(isLoading: true)));
      final response = await _storeRepo.getMyStore();
      response.when(
        onSuccess: (successData) {
          emit(state.copyWith(
            myStore: UIState(data: successData),
            selectedCategoryIndex: getSelectedCategoryIndex(successData.categoryId),
          ));
          storeNameController.text = successData.name;
          descriptionController.text = successData.description;
          locationUrlController.text = successData.locationUrl;
          locationNameController.text = successData.locationName;
          locationUrlController.text = successData.locationUrl;
        },
        onError: (domainErrorModel) {
          if (domainErrorModel.code == StatusCodes.notFound) {
            emit(state.copyWith(myStore: const UIState(data: defaultStore)));
          } else {
            emit(state.copyWith(myStore: UIState(error: domainErrorModel)));
          }
        },
      );
    } else {
      if (await fetchAllCategories()) fetchMyStore();
    }
  }

  Future<void> save() async {
    if (canGo()) {
      emit(state.copyWith(myStore: const UIState(isLoading: true)));
      final request = Store(
        id: state.myStore.data?.id ?? -1,
        userId: state.myStore.data?.userId ?? -1,
        categoryId: state.categories.data![state.selectedCategoryIndex!].id,
        name: storeNameController.text,
        storePicture: "not important",
        locationName: locationNameController.text,
        locationUrl: locationUrlController.text,
        description: descriptionController.text,
        createdAt: "",
        updatedAt: "",
        rating: null,
      );
      final response =
          await _storeRepo.updateMyStore(request, state.storeUploadedImage);
      response.when(
        onSuccess: (successData) {
          emit(state.copyWith(
            myStore: UIState(data: successData),
            selectedCategoryIndex: getSelectedCategoryIndex(successData.categoryId),
          ).withoutImage());
          storeNameController.text = successData.name;
          descriptionController.text = successData.description;
          locationUrlController.text = successData.locationUrl;
          locationNameController.text = successData.locationName;
          locationUrlController.text = successData.locationUrl;
          // emit(state
          //     .copyWith(myStore: UIState(data: successData))
          //     .withoutImage());
        },
        onError: (domainErrorModel) {
          emit(state.copyWith(myStore: UIState(error: domainErrorModel)));
        },
      );
    }
  }

  void removePicture() {
    emit(state.withoutImage());
  }

  Future<bool> fetchAllCategories() async {
    emit(state.copyWith(
        categories: const UIState(isLoading: true),
        myStore: const UIState(isLoading: true)));
    final ResponseResult<CategoryListResponseModel> result =
        await _categoryRepo.getAllCategories();
    return result.when<bool>(
      onSuccess: (successData) {
        emit(state.copyWith(categories: UIState(data: successData.data)));
        return true;
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(
            categories: UIState(error: domainErrorModel),
            myStore: UIState(error: domainErrorModel)));
        return false;
      },
    );
  }

  bool canGo() {
    if (state.categories.data == null) return false;
    if (state.selectedCategoryIndex == null) return false;
    return true;
  }

  void onCategorySelected(int? index) {
    emit(state.copyWith(selectedCategoryIndex: index));
  }

  int? getSelectedCategoryIndex(int categoryId) {
    final categories = state.categories.data;
    print(categories?.map((e) => e.name,).toList().toString());
    print(categoryId);
    if (categories != null) {
      for (int i = 0; i < categories.length; i++) {
        if (categories[i].id == categoryId) return i;
      }
    }
    return null;
  }
}

const defaultStore = Store(
    id: -1,
    userId: -1,
    categoryId: 1,
    name: "name",
    storePicture: null,
    locationName: "locationName",
    locationUrl: "locationUrl",
    description: "description",
    createdAt: "createdAt",
    updatedAt: "updatedAt",
    rating: null);
