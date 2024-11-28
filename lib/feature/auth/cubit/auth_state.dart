part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.success(AuthResponseModel successResponseModel) = _Success;
  const factory AuthState.error(DomainErrorModel error) = _Error;
  const factory AuthState.loading() = _Loading;
}
