import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_review.freezed.dart';
part 'product_review.g.dart';

@freezed
class ProductReview with _$ProductReview {
  const factory ProductReview({
    required int id,
    @JsonKey(name: "product_id") required int productId,
    required double rating,
    required String comment,
  }) = _ProductReview;

  factory ProductReview.fromJson(Map<String, Object?> json)
  => _$ProductReviewFromJson(json);
}