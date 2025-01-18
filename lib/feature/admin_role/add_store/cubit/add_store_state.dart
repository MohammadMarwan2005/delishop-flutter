part of 'add_store_cubit.dart';

@freezed
class AddStoreState with _$AddStoreState {
  const factory AddStoreState.initial() = _Initial;
  const factory AddStoreState.loading() = _Loading;
  const factory AddStoreState.success(AuthResponseModel successData) = _Success;
  const factory AddStoreState.error(DomainErrorModel domainErrorModel) = _Error;
}
