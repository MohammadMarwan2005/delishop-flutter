import 'dart:ui';

import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../location/location.dart';
import '../../store/store.dart';
import 'product_order/product_order.dart';

part 'order_response.freezed.dart';

part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required int id,
    @JsonKey(name: "store") required Store store,
    @JsonKey(name: "location") required Location? location,
    @JsonKey(name: "total_amount") required double totalAmount,
    @JsonKey(name: "order_date") required String orderDate,
    @JsonKey(name: "status") required OrderStatus status,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "products_order") required List<ProductOrder> productOrders,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, Object?> json) =>
      _$OrderResponseFromJson(json);
}

extension GetQuantsHelper on OrderResponse {
  Map<int, int> getQuantsMap() {
    return Map.fromEntries(
        productOrders.map((e) => MapEntry(e.id, e.quantity)));
  }
}

enum OrderStatus {
  pending("pending"),
  completed("completed"),
  sent("sent"),
  cancelled("cancelled"),
  rejected("rejected");

  const OrderStatus(this.stringValue);

  final String stringValue;

  Color getStatusColor() {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.sent:
        return Colors.blue;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.rejected:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return "Pending".tr(context);
      case OrderStatus.completed:
        return "Accepted".tr(context);
      case OrderStatus.sent:
        return "Delivered".tr(context);
      case OrderStatus.cancelled:
        return "Cancelled".tr(context);
      case OrderStatus.rejected:
        return "Rejected".tr(context);
      default:
        return "Cancelled".tr(context);
    }
  }

  String getMessage(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return "Pended Successfully!".tr(context);
      case OrderStatus.completed:
        return "Assigned Accepted!".tr(context);
      case OrderStatus.sent:
        return "Assigned Delivered!".tr(context);
      case OrderStatus.cancelled:
        return "Cancelled Successfully!".tr(context);
      case OrderStatus.rejected:
        return "Assigned Rejected!".tr(context);
      default:
        return "Unknown message...".tr(context);
    }
  }

  String getUserMessageBody(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return "Your order is in the queue and awaiting review by the mall."
            .tr(context);
      case OrderStatus.completed:
        return "Your order has been reviewed by the mall and will be delivered to you soon."
            .tr(context);
      case OrderStatus.sent:
        return "Your order has been delivered to you.".tr(context);
      case OrderStatus.cancelled:
        return "Your order has been cancelled by you.".tr(context);
      case OrderStatus.rejected:
        return "Your order has been rejected by the mall.".tr(context);
      default:
        return "An unexpected error occurred with your order.".tr(context);
    }
  }

  String getStoreMessageBody(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return "A new order is in the queue and awaiting your review."
            .tr(context);
      case OrderStatus.completed:
        return "You have reviewed the order. Please prepare it for delivery."
            .tr(context);
      case OrderStatus.sent:
        return "The order has been delivered to the customer.".tr(context);
      case OrderStatus.cancelled:
        return "The order has been cancelled by the customer.".tr(context);
      case OrderStatus.rejected:
        return "You have rejected the customer's order.".tr(context);
      default:
        return "An unexpected error occurred with the order.".tr(context);
    }
  }


  IconData getIconData(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return Icons.pending;
      case OrderStatus.completed:
        return Icons.check_circle_rounded;
      case OrderStatus.sent:
        return Icons.check_circle_rounded;
      case OrderStatus.cancelled:
        return Icons.cancel;
      case OrderStatus.rejected:
        return Icons.cancel;
      default:
        return Icons.cancel;
    }
  }

  Widget getIcon(BuildContext context, bool isStore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(getIconData(context), size: 100, color: getStatusColor()),
        Text(
          getLabel(context),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 4),
        Text(
          textAlign: TextAlign.center,
          (isStore) ? getStoreMessageBody(context) : getUserMessageBody(context),
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }

  Widget getChip(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
      label: Text(
        getLabel(context).toUpperCase(),
        style: const TextStyle(color: Colors.white).copyWith(fontSize: 9),
      ),
      backgroundColor: getStatusColor(),
    );
  }
}
