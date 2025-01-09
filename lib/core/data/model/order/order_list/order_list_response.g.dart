// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderListResponseImpl _$$OrderListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderListResponseImplToJson(
        _$OrderListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
