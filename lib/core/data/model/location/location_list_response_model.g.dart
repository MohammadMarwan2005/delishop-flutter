// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationListResponseModelImpl _$$LocationListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationListResponseModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LocationListResponseModelImplToJson(
        _$LocationListResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
