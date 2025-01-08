import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_balance_response.freezed.dart';
part 'wallet_balance_response.g.dart';

@freezed
class WalletBalanceResponse with _$WalletBalanceResponse {
  const factory WalletBalanceResponse({
    required String balance
  }) = _WalletBalanceResponse;

  factory WalletBalanceResponse.fromJson(Map<String, Object?> json)
  => _$WalletBalanceResponseFromJson(json);
}