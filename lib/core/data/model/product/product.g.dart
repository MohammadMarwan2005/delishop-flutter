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
      price: json['price'] as String,
      discount: json['discount'] as String,
      quantity: (json['quantity'] as num).toInt(),
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
    };