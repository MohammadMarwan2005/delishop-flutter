import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_list_response.freezed.dart';
part 'order_list_response.g.dart';

@freezed
class OrderListResponse with _$OrderListResponse {
  const factory OrderListResponse({
    required List<OrderResponse> data
  }) = _OrderListResponse;

  factory OrderListResponse.fromJson(Map<String, Object?> json)
  => _$OrderListResponseFromJson(json);
}