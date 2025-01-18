import 'package:delishop/core/data/model/transaction/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_list_response.freezed.dart';
part 'transaction_list_response.g.dart';

@freezed
class TransactionListResponse with _$TransactionListResponse {
  const factory TransactionListResponse({
    required List<Transaction> data
  }) = _TransactionListResponse;

  factory TransactionListResponse.fromJson(Map<String, Object?> json)
  => _$TransactionListResponseFromJson(json);
}