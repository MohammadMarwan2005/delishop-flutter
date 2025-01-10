import 'package:freezed_annotation/freezed_annotation.dart';
part 'store_review.freezed.dart';
part 'store_review.g.dart';

@freezed
class StoreReview with _$StoreReview {
  const factory StoreReview({
    required int id,
    @JsonKey(name: "store_id") required int productId,
    required double rating,
    required String comment,
  }) = _StoreReview;

  factory StoreReview.fromJson(Map<String, Object?> json)
  => _$StoreReviewFromJson(json);
}