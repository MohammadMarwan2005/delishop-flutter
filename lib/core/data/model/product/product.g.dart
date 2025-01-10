// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      storeId: (json['store_id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      productPicture: json['product_picture'] as String?,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      isFavorite: json['is_favorite'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_id': instance.storeId,
      'name': instance.name,
      'description': instance.description,
      'product_picture': instance.productPicture,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'is_favorite': instance.isFavorite,
      'rating': instance.rating,
    };
