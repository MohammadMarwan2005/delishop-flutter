import 'package:delishop/core/data/model/location/location.dart';
import 'package:delishop/core/data/model/order/create_order_request/create_order_request.dart';
import 'package:delishop/core/data/model/order/create_order_request/order_item/order_item.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/data/model/store/store.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class OrderEntity extends Equatable {
  final Store store;
  final List<Product> products;

  const OrderEntity({
    required this.store,
    required this.products,
  });

  @override
  List<Object?> get props => [store, products];

  OrderEntity copyWith({
    Store? store,
    List<Product>? products,
  }) {
    return OrderEntity(
      store: store ?? this.store,
      products: products ?? this.products,
    );
  }

  double getOrderPrice(Map<int, int> quants) {
    double value = 0;
    for (int index = 0; index < products.length; index++) {
      value += products[index].price *
          (quants[products[index].id] ?? 1);
    }
    return value;
  }

  String getCheckoutButtonLabel(
      BuildContext context, Map<int, int> quants, String currentLangCode) {
    if (currentLangCode == 'ar') {
      return "اطلب من ${store.name} بمبلغ \$${getOrderPrice(quants)}";
    }
    return "Order from ${store.name} for \$${getOrderPrice(quants)}";
  }

  CreateOrderRequest toOrder(Map<int, int> quants, Location location, String description) {
    return CreateOrderRequest(
      description: description,
      storeId: store.id,
      locationId: location.id!,
      products: products
          .map(
            (e) => OrderItem(productId: e.id, quantity: quants[e.id] ?? 1),
          )
          .toList(),
    );
  }
}
