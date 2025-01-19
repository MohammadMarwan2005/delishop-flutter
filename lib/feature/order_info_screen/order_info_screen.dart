import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/delishop_text_field.dart';
import 'package:delishop/core/widgets/location_label.dart';
import 'package:delishop/feature/bottom_nav_host/bottom_nav_host.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/di_get_it.dart';
import '../../core/theme/delishop_text_styles.dart';
import '../../core/widgets/delishop_button.dart';
import '../../core/widgets/my_alert_dialog.dart';
import '../account/cubit/account_cubit.dart';
import '../favorite/favorite_cubit.dart';
import '../home/home_cubit.dart';
import '../order/widgets/order_summery_product_card.dart';
import '../product_full_screen/product_full_screen.dart';

class OrderInfoScreen extends StatefulWidget {
  final OrderResponse order;
  final Function() onPop;
  final bool showOk;
  final bool isStore;

  const OrderInfoScreen({
    super.key,
    required this.order,
    required this.onPop,
    this.showOk = false,
    this.isStore = false,
  });

  @override
  State<OrderInfoScreen> createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  void dispose() {
    widget.onPop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            ((widget.isStore) ? "Order Details (Mall)" : "Order Details")
                .tr(context)),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 24),
          child: (widget.showOk)
              ? DelishopButton(
                  onPressed: () {
                    context.removeAndPush(MultiBlocProvider(providers: [
                      BlocProvider<HomeCubit>(create: (context) => getIt()),
                      BlocProvider<FavoriteCubit>(create: (context) => getIt()),
                      BlocProvider<AccountCubit>(create: (context) => getIt()),
                    ], child: const BottomNavHost()));
                  },
                  text: "OK".tr(context))
              // : (widget.order.status == OrderStatus.pending)
              : BlocConsumer<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return getUserActions(context, state, widget.isStore,
                        widget.order.id, widget.order.status);
                  },
                  listener: (context, state) {
                    state.changeOrderStatusResponse.when(
                      onLoading: () {},
                      onSuccess: (data) {
                        showDialog(
                          context: context,
                          builder: (innerContext) {
                            return MyAlertDialog(
                              title: data.status.getMessage(context),
                              details: widget.order.productOrders
                                  .map((e) => e.name)
                                  .toList(),
                              isError: false,
                              onGotItClicked: () {
                                innerContext.pop();
                              },
                            );
                          },
                        );
                      },
                      onError: (domainError) {
                        context.setupErrorState(domainError);
                      },
                    );
                  },
                )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Center(
                child: widget.order.status.getIcon(context, widget.isStore),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text("Mall".tr(context),
                      style: Theme.of(context).textTheme.headlineSmall)
                ],
              ),
              SizedBox(height: 4.h),
              StoreInfo(store: widget.order.store),
              SizedBox(height: 16.h),
              Text("Products".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              ...widget.order.productOrders
                  .map((productData) => OrderSummeryProductCard(
                        clickable: true,
                        product: productData.product,
                        quantity: productData.quantity,
                      )),
              Padding(
                padding: EdgeInsets.only(top: 32.h, bottom: 32.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Total:".tr(context),
                      style: DelishopTextStyles.font24OrangeBold
                          .copyWith(fontSize: 22)
                          .copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                    ),
                    Text(
                      "\$${widget.order.totalAmount}",
                      // The price
                      style: DelishopTextStyles.font24OrangeBold
                          .copyWith(fontSize: 22),
                    )
                  ],
                ),
              ),
              Text("Location".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LocationLabel(location: widget.order.location),
              ),
              SizedBox(height: 16.h),
              Text(((widget.isStore) ? "User Notes" : "Your Notes").tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.order.description.toString(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              SizedBox(height: 16.h),
              (widget.order.message != null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rejection Reason".tr(context),
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 4.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(widget.order.message.toString(),
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        SizedBox(height: 16.h)
                      ],
                    )
                  : const SizedBox.shrink(),
              Text("Ordered on".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.order.orderDate,
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getUserActions(BuildContext context, OrderState state, bool isStore,
    int orderId, OrderStatus currentOrderStatus) {
  final bool canCancel = !isStore;
  final bool canComplete = isStore; // Accept
  final bool canSend = isStore; // Deliver
  final bool canReject = isStore;

  final isLoading = state.changeOrderStatusResponse.isLoading != null;
  final enabled = !isLoading;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (canCancel && currentOrderStatus == OrderStatus.pending)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DelishopButton(
            isLoading: isLoading,
            text: "Cancel Order".tr(context),
            textColor: enabled ? Colors.white : Colors.black.withOpacity(0.5),
            onPressed: enabled
                ? () {
                    context.read<OrderCubit>().cancelOrder(orderId);
                  }
                : null,
          ),
        ),
      if (canComplete && currentOrderStatus == OrderStatus.pending)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DelishopButton(
            isLoading: isLoading,
            text: "Accept Order".tr(context),
            textColor: enabled ? Colors.white : Colors.black.withOpacity(0.5),
            onPressed: enabled
                ? () {
                    showConfirmationDialog(
                        title: "Accept Order".tr(context),
                        supportingText:
                        "Are you sure you want to accept this order? This action cannot be undone."
                            .tr(context),
                        label: "Optional Notes".tr(context),
                        onSubmit: (message) {
                          context.read<OrderCubit>().changeOrderStatus(
                                orderId,
                                OrderStatus.completed,
                                message: message,
                              );
                        },
                        context: context);
                  }
                : null,
          ),
        ),
      if (canReject && currentOrderStatus == OrderStatus.pending)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DelishopButton(
            isLoading: isLoading,
            text: "Reject Order".tr(context),
            textColor: enabled ? Colors.white : Colors.black.withOpacity(0.5),
            onPressed: enabled
                ? () {
                    showConfirmationDialog(
                        title: "Reject Order".tr(context),
                        supportingText:
                            "Please provide a reason for rejecting the order."
                                .tr(context),
                        label: "Rejection Reason".tr(context),
                        onSubmit: (message) {
                          context.read<OrderCubit>().changeOrderStatus(
                                orderId,
                                OrderStatus.rejected,
                                message: message,
                              );
                        },
                        context: context);
                  }
                : null,
          ),
        ),
      if (canSend && currentOrderStatus == OrderStatus.completed)
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DelishopButton(
            isLoading: isLoading,
            text: "Sent Order".tr(context),
            textColor: enabled ? Colors.white : Colors.black.withOpacity(0.5),
            onPressed: enabled
                ? () {
                    context
                        .read<OrderCubit>()
                        .changeOrderStatus(orderId, OrderStatus.sent);
                  }
                : null,
          ),
        ),
    ],
  );
}

void showConfirmationDialog(
    {required String title,
    required String supportingText,
    required String label,
    required Function(String message) onSubmit,
    required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext innerContext) {
      final TextEditingController messageController = TextEditingController();
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(supportingText),
            const SizedBox(height: 16.0),
            DelishopTextField(
                textEditingController: messageController, labelText: label),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel".tr(context)),
          ),
          DelishopButton(
              onPressed: () {
                final message = messageController.text.trim();
                onSubmit(message);
                Navigator.of(context).pop();
              },
              text: "Submit")
        ],
      );
    },
  );
}
