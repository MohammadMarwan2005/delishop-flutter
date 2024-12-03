import 'package:delishop/core/data/model/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_list_response_model.freezed.dart';
part 'product_list_response_model.g.dart';

@freezed
class ProductListResponseModel with _$ProductListResponseModel {
  const factory ProductListResponseModel({
    required List<Product> data
  }) = _ProductListResponseModel;

  factory ProductListResponseModel.fromJson(Map<String, Object?> json)
  => _$ProductListResponseModelFromJson(json);
}