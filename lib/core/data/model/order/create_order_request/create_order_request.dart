import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_item/order_item.dart';
part 'create_order_request.freezed.dart';
part 'create_order_request.g.dart';

@freezed
class CreateOrderRequest with _$CreateOrderRequest {
  const factory CreateOrderRequest({
    @JsonKey(name: "store_id") required int storeId,
    @JsonKey(name: "location_id") required int locationId,
    @Default("-") String description,
    required List<OrderItem> products,
  }) = _CreateOrderRequest;

  factory CreateOrderRequest.fromJson(Map<String, Object?> json)
  => _$CreateOrderRequestFromJson(json);
}