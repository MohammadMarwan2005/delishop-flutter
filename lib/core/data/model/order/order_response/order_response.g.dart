// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      id: (json['order_id'] as num).toInt(),
      storeId: (json['store_id'] as num).toInt(),
      locationId: (json['location_id'] as num).toInt(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      orderDate: json['order_date'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      productOrder: (json['content'] as List<dynamic>)
          .map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'order_id': instance.id,
      'store_id': instance.storeId,
      'location_id': instance.locationId,
      'total_amount': instance.totalAmount,
      'order_date': instance.orderDate,
      'status': instance.status,
      'description': instance.description,
      'content': instance.productOrder,
    };
