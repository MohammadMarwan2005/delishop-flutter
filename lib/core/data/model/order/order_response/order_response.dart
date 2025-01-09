import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_order/product_order.dart';
part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    @JsonKey(name: "order_id") required int id,
    @JsonKey(name: "store_id") required int storeId,
    @JsonKey(name: "location_id") required int locationId,
    @JsonKey(name: "total_amount") required double totalAmount,
    @JsonKey(name: "order_date") required String orderDate,
    @JsonKey(name: "status") required String status,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "content") required List<ProductOrder> productOrder,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, Object?> json)
  => _$OrderResponseFromJson(json);
}