// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryListResponseModelImpl _$$CategoryListResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryListResponseModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryListResponseModelImplToJson(
        _$CategoryListResponseModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
