// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      message: json['message'] as String,
      data: SuccessAuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$SuccessAuthDataImpl _$$SuccessAuthDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SuccessAuthDataImpl(
      token: json['token'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      roleId: (json['role_id'] as num).toInt(),
    );

Map<String, dynamic> _$$SuccessAuthDataImplToJson(
        _$SuccessAuthDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role_id': instance.roleId,
    };
