// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_money_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositMoneyRequestImpl _$$DepositMoneyRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DepositMoneyRequestImpl(
      phoneNumber: json['phone_number'] as String,
      amount: (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DepositMoneyRequestImplToJson(
        _$DepositMoneyRequestImpl instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'balance': instance.amount,
    };
