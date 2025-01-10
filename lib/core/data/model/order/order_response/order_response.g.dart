// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderResponseImpl _$$OrderResponseImplFromJson(Map<String, dynamic> json) =>
    _$OrderResponseImpl(
      id: (json['id'] as num).toInt(),
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      totalAmount: (json['total_amount'] as num).toDouble(),
      orderDate: json['order_date'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      description: json['description'] as String?,
      productOrders: (json['products_order'] as List<dynamic>)
          .map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderResponseImplToJson(_$OrderResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
      'location': instance.location,
      'total_amount': instance.totalAmount,
      'order_date': instance.orderDate,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'description': instance.description,
      'products_order': instance.productOrders,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.completed: 'completed',
  OrderStatus.sent: 'sent',
  OrderStatus.cancelled: 'cancelled',
};
