import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/data/repo/product_repo.dart';
import 'package:delishop/core/data/repo/store_repo.dart';
import 'package:delishop/core/data/response_result.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';

// class OrderResponseToOrderEntityUseCase {
//   final StoreRepo _storeRepo;
//   final ProductRepo _productRepo;
//
//   OrderResponseToOrderEntityUseCase(this._storeRepo, this._productRepo);
//
//   Future<ResponseResult<OrderEntity>> call(OrderResponse orderResponse) async {
//     final storeResponse = await _storeRepo.getStoreById(orderResponse.storeId);
//     final products =
//         await _productRepo.getProductsByStoreId(orderResponse.storeId);
//     return storeResponse.when<ResponseResult<OrderEntity>>(
//       onSuccess: (successStoreData) {
//         return products.when<ResponseResult<OrderEntity>>(
//           onSuccess: (successProductsData) {
//             final ids = orderResponse.productOrders.map((e) => e.id);
//             final products = successProductsData.data
//                 .where((product) => ids.contains(product.id))
//                 .toList();
//             return Success(OrderEntity(store: successStoreData, products: products));
//           },
//           onError: (domainErrorModel) {
//             return Error(domainErrorModel);
//           },
//         );
//       },
//       onError: (domainErrorModel) {
//         return Error(domainErrorModel);
//       },
//     );
//   }
// }
