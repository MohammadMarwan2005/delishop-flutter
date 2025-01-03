import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';

import '../../../core/data/response_result.dart';

class GetOrderEntitiesUseCase {
  final StoreRepo _storeRepo;

  GetOrderEntitiesUseCase(this._storeRepo);

  Future<ResponseResult<List<OrderEntity>>> call(
      List<Product> productsInCart, Map<int, int> quants) async {
    Map<int, List<Product>> productsByStoreId = {};
    for (var product in productsInCart) {
      if (productsByStoreId[product.storeId] == null) {
        productsByStoreId[product.storeId] = [product];
      } else {
        productsByStoreId[product.storeId]!.add(product);
      }
    }
    print("productsByStoreId $productsByStoreId");

    final storesIds = productsByStoreId.keys.toList();

    final response = await _storeRepo.getStoresByIds(storesIds);
    ResponseResult<List<OrderEntity>>? result;
    response.when(
      onSuccess: (successData) {
        if (successData.data.length == storesIds.length) {
          List<OrderEntity> orders = [];
          for (int index = 0; index < storesIds.length; index++) {
            orders.add(OrderEntity(
                store: successData.data[index],
                products: productsByStoreId[storesIds[index]]!,
                /*quants: quants*/));
          }
          result = Success(orders);
        } else {
          result = const Error(DomainErrorModel(
              message: "Server Error",
              code: 500,
              details: ["The server is returning a wrong list"]));
        }
      },
      onError: (domainErrorModel) {
        return domainErrorModel;
      },
    );
    return result!;
  }
}
