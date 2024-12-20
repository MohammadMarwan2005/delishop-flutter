import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

part 'store.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required int id,
    @JsonKey(name: "user_id") required int userId,
    @JsonKey(name: "category_id") required int categoryId,
    required String name,
    @JsonKey(name: "store_picture") required String storePicture,
    required String location,
    required String description,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "is_favorite") required bool? isFavorite,
    @JsonKey(name: "rating") required String? rating,
  }) = _store;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}
