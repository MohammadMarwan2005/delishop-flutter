import 'package:delishop/core/helpers/image_string_helper.dart';
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
