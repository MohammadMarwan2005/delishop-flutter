import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';
import 'package:equatable/equatable.dart';

class OrderHeroModel extends Equatable {
  final OrderResponse orderResponse;
  final List<Product> orderEntity;

  const OrderHeroModel({required this.orderResponse, required this.orderEntity});

  @override
  List<Object?> get props => [orderEntity, orderResponse];
}