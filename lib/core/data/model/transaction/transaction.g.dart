// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      phoneNumber: json['phone_number'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: json['created_at'] as String,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'amount': instance.amount,
      'created_at': instance.date,
    };
