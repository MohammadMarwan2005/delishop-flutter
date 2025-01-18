import 'package:freezed_annotation/freezed_annotation.dart';
part 'deposit_money_request.freezed.dart';
part 'deposit_money_request.g.dart';

@freezed
class DepositMoneyRequest with _$DepositMoneyRequest {
  const factory DepositMoneyRequest({
    @JsonKey(name: "phone_number") required String phoneNumber,
    @JsonKey(name: "balance") required double? amount,
  }) = _DepositMoneyRequest;

  factory DepositMoneyRequest.fromJson(Map<String, Object?> json)
  => _$DepositMoneyRequestFromJson(json);
}