// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateOrderRequestImpl _$$CreateOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateOrderRequestImpl(
      storeId: (json['store_id'] as num).toInt(),
      locationId: (json['location_id'] as num).toInt(),
      description: json['description'] as String? ?? "-",
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreateOrderRequestImplToJson(
        _$CreateOrderRequestImpl instance) =>
    <String, dynamic>{
      'store_id': instance.storeId,
      'location_id': instance.locationId,
      'description': instance.description,
      'products': instance.products,
    };
