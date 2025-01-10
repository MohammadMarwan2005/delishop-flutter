import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../product/product.dart';
part 'product_order.freezed.dart';
part 'product_order.g.dart';

@freezed
class ProductOrder with _$ProductOrder {
  const factory ProductOrder({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "product_id") required int productId,
    @JsonKey(name: "order_id") required int orderId,
    required String name,
    required double price,
    required int quantity,
    required double subtotal,
    required Product product,
  }) = _ProductOrder;

  factory ProductOrder.fromJson(Map<String, Object?> json) =>
      _$ProductOrderFromJson(json);
}
