// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$storeImpl _$$storeImplFromJson(Map<String, dynamic> json) => _$storeImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      categoryId: (json['category_id'] as num).toInt(),
      name: json['name'] as String,
      storePicture: json['store_picture'] as String?,
      locationName: json['location_name'] as String,
      locationUrl: json['location_url'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$$storeImplToJson(_$storeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'store_picture': instance.storePicture,
      'location_name': instance.locationName,
      'location_url': instance.locationUrl,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'rating': instance.rating,
    };
