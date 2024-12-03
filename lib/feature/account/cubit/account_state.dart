part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = Loading;
  const factory AccountState.success(String firstName, String lastName, String token) = Success;
  const factory AccountState.error(DomainErrorModel error) = Error;
}
