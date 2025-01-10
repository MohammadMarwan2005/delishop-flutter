// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewImpl _$$ProductReviewImplFromJson(Map<String, dynamic> json) =>
    _$ProductReviewImpl(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$ProductReviewImplToJson(_$ProductReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
