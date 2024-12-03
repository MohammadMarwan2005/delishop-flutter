import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    @JsonKey(name: "category_picture") required String? categoryPicture,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json)
  => _$CategoryFromJson(json);
}