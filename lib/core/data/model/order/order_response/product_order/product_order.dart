import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_order.freezed.dart';
part 'product_order.g.dart';

@freezed
class ProductOrder with _$ProductOrder {
  const factory ProductOrder({
    @JsonKey(name: "product_id") required int productId,
    required String name,
    required String price,
    required int quantity,
    required double subtotal,
  }) = _ProductOrder;

  factory ProductOrder.fromJson(Map<String, Object?> json) =>
      _$ProductOrderFromJson(json);
}
