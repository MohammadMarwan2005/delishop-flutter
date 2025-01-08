import 'package:delishop/core/data/db_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    @JsonKey(name: "store_id") required int storeId,
    required String name,
    required String description,
    @JsonKey(name: "product_picture") required String? productPicture,
    required String price,
    required String discount,
    required int quantity,
    @JsonKey(name: "is_favorite") required bool? isFavorite,
    @JsonKey(name: "rating") required double? rating,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

}

extension BooleanExtension on bool {
  bool notOrNull() {
    return !this;
  }
}

extension ProductMapper on Product {
  ProductDataModel toProductDataModel() {
    return ProductDataModel(
        id: id,
        storeId: storeId,
        name: name,
        description: description,
        productPicture: productPicture,
        price: price,
        discount: discount,
        quantity: quantity);
  }

  Product copyWithInvertedFav() {
    return copyWith(isFavorite: isFavorite?.notOrNull());
  }
}

extension RemovingFromCartHelper on String {

  String getRemovedFromCartMessage(String currentLangCode) {
    if (currentLangCode == 'ar') {
      return "تمت إزالة $this من السلة!";
    }
    return "$this Removed From Cart!";
  }
}
