// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionListResponseImpl _$$TransactionListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TransactionListResponseImplToJson(
        _$TransactionListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
