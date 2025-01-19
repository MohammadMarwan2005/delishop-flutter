import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/repo/product_repo.dart';

part 'add_update_product_state.dart';

class AddUpdateProductCubit extends Cubit<AddUpdateProductState> {
  final ImagePicker _imagePicker;
  final ProductRepo _productRepo;
  final Product product;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  AddUpdateProductCubit(this._imagePicker, this._productRepo, this.product)
      : super(
          AddUpdateProductState(
            product: UIState(data: product),
          ),
        ) {
    emitCachedData();
  }

  Future<void> pickImage() async {
    final XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    print('pickedImage != null: ${pickedImage != null}');
    if (pickedImage != null) {
      emit(state.copyWith(image: File(pickedImage.path)));
    }
  }

  Future<void> postProduct() async {
    print('product.id: ${product.id}');
    final req = product.copyWith(
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      discount: double.parse(discountController.text),
      quantity: int.parse(quantityController.text),
    );

    emit(state.copyWith(product: const UIState(isLoading: true)));
    final response = (product.id == constProduct.id)
        ? await _productRepo.createProduct(req, state.image)
        : await _productRepo.updateProduct(req, state.image);
    response.when(
      onSuccess: (successData) {
        emit(state.copyWith(product: UIState(data: successData)));
        removePicture();
      },
      onError: (domainErrorModel) {
        emit(state.copyWith(product: UIState(error: domainErrorModel)));
      },
    );
  }

  void emitCachedData() {
    fillProduct(
      name: product.name,
      description: product.description,
      price: product.price,
      discount: product.discount,
      quantity: product.quantity,
    );
    emit(state.copyWith(product: UIState(data: product)));
  }

  void removePicture() {
    emit(state.withoutImage());
  }

  void fillProduct({
    required String name,
    required String description,
    String? productPicture,
    required double price,
    required double discount,
    required int quantity,
  }) {
    nameController.text = name;
    descriptionController.text = description;
    priceController.text = price.toString();
    discountController.text = discount.toString();
    quantityController.text = quantity.toString();
  }
}

const constProduct = Product(
  id: -1,
  storeId: -1,
  name: "",
  description: "",
  productPicture: null,
  price: 100,
  discount: 0,
  quantity: 5,
  isFavorite: null,
  rating: null,
);

Product getDefaultProduct({
  required String name,
  required String description,
  String? productPicture,
  required double price,
  required double discount,
  required int quantity,
}) {
  return Product(
    id: -1,
    storeId: -1,
    name: name,
    description: description,
    productPicture: productPicture,
    price: price,
    discount: discount,
    quantity: quantity,
    isFavorite: null,
    rating: null,
  );
}
