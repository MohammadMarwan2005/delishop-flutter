part of 'my_products_cubit.dart';

@freezed
class MyProductsState with _$MyProductsState {
  const factory MyProductsState.initial() = _Initial;
  const factory MyProductsState.loading() = _Loading;
  const factory MyProductsState.success(List<Product> products) = _Success;
  const factory MyProductsState.error(DomainErrorModel errorModel) = _Error;
}
