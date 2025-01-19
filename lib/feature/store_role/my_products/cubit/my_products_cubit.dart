import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/model/domain_error_model.dart';
import '../../../../core/data/model/product/product.dart';
import '../../../../core/data/repo/product_repo.dart';

part 'my_products_state.dart';
part 'my_products_cubit.freezed.dart';

class MyProductsCubit extends Cubit<MyProductsState> {
  final ProductRepo _productRepo;

  MyProductsCubit(this._productRepo) : super(const MyProductsState.initial()) {
    Future.wait([fetchMyProducts()]);
  }

  Future<void> fetchMyProducts() async {
    emit(const MyProductsState.loading());

    final response = await _productRepo.getMyProducts();
    response.when(
      onSuccess: (successData) {
        emit(MyProductsState.success(successData.data));
      },
      onError: (domainErrorModel) {
        emit(MyProductsState.error(domainErrorModel));
      },
    );
  }
}
