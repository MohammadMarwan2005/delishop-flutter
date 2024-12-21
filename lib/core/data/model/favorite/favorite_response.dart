import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_response.freezed.dart';
part 'favorite_response.g.dart';

@freezed
class FavoriteResponse with _$FavoriteResponse {
  const factory FavoriteResponse({
    required String message,
  }) = _FavoriteResponse;

  factory FavoriteResponse.fromJson(Map<String, Object?> json)
  => _$FavoriteResponseFromJson(json);
}