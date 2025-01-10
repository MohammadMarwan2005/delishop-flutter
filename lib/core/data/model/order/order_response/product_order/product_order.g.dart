// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductOrderImpl _$$ProductOrderImplFromJson(Map<String, dynamic> json) =>
    _$ProductOrderImpl(
      id: (json['id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      orderId: (json['order_id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toDouble(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductOrderImplToJson(_$ProductOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'order_id': instance.orderId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'product': instance.product,
    };
