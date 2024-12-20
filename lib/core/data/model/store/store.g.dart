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
      storePicture: json['store_picture'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isFavorite: json['is_favorite'] as bool?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$$storeImplToJson(_$storeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'name': instance.name,
      'store_picture': instance.storePicture,
      'location': instance.location,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_favorite': instance.isFavorite,
      'rating': instance.rating,
    };
