// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductListResponseModelImpl _$$ProductListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListResponseModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductListResponseModelImplToJson(
        _$ProductListResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
