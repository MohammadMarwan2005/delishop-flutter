import 'package:delishop/core/data/model/order/order_response/order_response.dart';
import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
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

  const OrderInfoScreen(
      {super.key,
      required this.order,
      required this.onPop,
      this.showOk = false});

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
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Info".tr(context)),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: widget.order.status.getChip(context),
            )
          ],
        ),
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
            : (widget.order.status == OrderStatus.pending)
                ? BlocConsumer<OrderCubit, OrderState>(
                    builder: (context, state) {
                      final isLoading =
                          state.cancelOrderResponse.isLoading != null;
                      final enabled = !isLoading;
                      return DelishopButton(
                        isLoading: isLoading,
                        text: "Cancel Order".tr(context),
                        textColor: enabled
                            ? Colors.white
                            : Colors.black.withOpacity(0.5),
                        onPressed: enabled
                            ? () {
                                context
                                    .read<OrderCubit>()
                                    .cancelOrder(widget.order.id);
                              }
                            : null,
                      );
                    },
                    listener: (context, state) {
                      state.cancelOrderResponse.when(
                        onLoading: () {},
                        onSuccess: (data) {
                          showDialog(
                            context: context,
                            builder: (innerContext) {
                              return MyAlertDialog(
                                title:
                                    "Cancelled Successfully".tr(innerContext),
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
                  )
                : const SizedBox.shrink(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Center(
                child: widget.order.status.getIcon(context),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Text("Malls".tr(context),
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
              Text("Notes".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(widget.order.description.toString(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              SizedBox(height: 16.h),
              Text("Location".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LocationLabel(location: widget.order.location),
              ),
              SizedBox(height: 16.h),
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
