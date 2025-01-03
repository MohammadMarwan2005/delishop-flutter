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
    for (int index = 0;index <products.length; index ++) {
      value += double.parse(products[index].price) * (quants[products[index].id] ?? 1);
    }
    return value;
  }

  String getCheckoutButtonLabel(BuildContext context, Map<int, int> quants, String currentLangCode) {
    if (currentLangCode == 'ar') {
      return "اطلب من ${store.name} بمبلغ \$${getOrderPrice(quants)}";
    }
    return "Order from ${store.name} for \$${getOrderPrice(quants)}";
  }
}
