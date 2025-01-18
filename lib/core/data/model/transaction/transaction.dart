import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @JsonKey(name: "phone_number") required String phoneNumber,
    required double amount,
    @JsonKey(name: "created_at") required String date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json)
  => _$TransactionFromJson(json);
}