part of 'deposit_money_cubit.dart';

@freezed
class DepositMoneyState with _$DepositMoneyState {
  const factory DepositMoneyState.initial() = _Initial;
  const factory DepositMoneyState.success(WalletBalanceResponse response) = _Success;
  const factory DepositMoneyState.error(DomainErrorModel error) = _Error;
  const factory DepositMoneyState.loading() = _Loading;
}
