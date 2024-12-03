import 'package:delishop/core/data/model/category/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_list_response_model.freezed.dart';
part 'category_list_response_model.g.dart';

@freezed
class CategoryListResponseModel with _$CategoryListResponseModel {
  const factory CategoryListResponseModel({
    required List<Category> data,
  }) = _CategoryListResponseModel;

  factory CategoryListResponseModel.fromJson(Map<String, Object?> json)
  => _$CategoryListResponseModelFromJson(json);
}