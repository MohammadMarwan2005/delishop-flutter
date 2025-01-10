// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreReviewImpl _$$StoreReviewImplFromJson(Map<String, dynamic> json) =>
    _$StoreReviewImpl(
      id: (json['id'] as num).toInt(),
      productId: (json['store_id'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$StoreReviewImplToJson(_$StoreReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.productId,
      'rating': instance.rating,
      'comment': instance.comment,
    };
