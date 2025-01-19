import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/location_label.dart';
import 'package:delishop/feature/cart/cart_screen.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:delishop/feature/order_info_screen/order_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/loading.dart';
import '../../core/widgets/no_result_message.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderCubit>().fetchAllWithoutLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders".tr(context))),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return state.myOrdersResponse.when(
            onLoading: () {
              return const Loading();
            },
            onSuccess: (data) {
              if (data.isEmpty) {
                return NoResultMessage(
                  height: 200.h,
                  messageLabel: "You have no orders yet.".tr(context),
                  buttonLabel: "Go to Cart!".tr(context),
                  onButtonClicked: () {
                    context.push(const CartScreen());
                  },
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<OrderCubit>().fetchAll();
                },
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final isUser = context.read<OrderCubit>().isUser();
                    return OrderCard(orderResponse: data[index], isStore: !isUser);
                  },
                ),
              );
            },
            onError: (domainError) {
              return ErrorMessage(
                message: domainError.message,
                onTryAgain: () {
                  context.read<OrderCubit>().fetchAll();
                },
              );
            },
          );
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderResponse orderResponse;
  final bool isStore;

  const OrderCard(
      {super.key, required this.orderResponse, this.isStore = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(BlocProvider.value(
          value: context.read<OrderCubit>(),
          child: OrderInfoScreen(
            isStore: isStore,
            order: orderResponse,
            onPop: () {
              context.read<OrderCubit>().fetchAllWithoutLoading();
              context.read<CartCubit>().reloadAllData();
            },
          ),
        ));
      },
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 16, left: 8, right: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 56,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: List.generate(
                              3,
                                  (index) {
                                if (index >=
                                    orderResponse.productOrders.length) {
                                  return const SizedBox.shrink();
                                }
                                return Positioned(
                                  left: index * 20.0,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundImage: NetworkImage(orderResponse
                                        .productOrders[index]
                                        .product
                                        .productPicture!
                                        .validatePicture()),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${orderResponse.productOrders
                                    .length} ${"Products from".tr(
                                    context)} ${orderResponse.store.name}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              LocationLabel(location: orderResponse.location),
                              const SizedBox(height: 4),
                              Text(
                                "${"Ordered on".tr(context)}: ${orderResponse
                                    .orderDate}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${"Total:".tr(context)}  \$${orderResponse
                                    .totalAmount}",
                                style: DelishopTextStyles.priceStyle,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    child: orderResponse.status.getChip(context),
                  )
                ],
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
