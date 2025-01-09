import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    @JsonKey(name: "product_id") required int productId,
    required int quantity,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, Object?> json)
  => _$OrderItemFromJson(json);
}