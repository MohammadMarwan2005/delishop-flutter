// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreListResponseModelImpl _$$StoreListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StoreListResponseModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoreListResponseModelImplToJson(
        _$StoreListResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
