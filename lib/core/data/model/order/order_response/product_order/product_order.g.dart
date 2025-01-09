// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductOrderImpl _$$ProductOrderImplFromJson(Map<String, dynamic> json) =>
    _$ProductOrderImpl(
      productId: (json['product_id'] as num).toInt(),
      name: json['name'] as String,
      price: json['price'] as String,
      quantity: (json['quantity'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductOrderImplToJson(_$ProductOrderImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
    };
