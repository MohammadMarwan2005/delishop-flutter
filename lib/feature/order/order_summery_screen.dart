import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/delishop_text_field.dart';
import 'package:delishop/feature/bottom_nav_host/wallet_label.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
import 'package:delishop/feature/cart/logic/order_entity.dart';
import 'package:delishop/feature/cart/widgets/tabbed_cart_list.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:delishop/feature/order/widgets/order_summery_product_card.dart';
import 'package:delishop/feature/order_info_screen/order_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/lang/lang_code_cubit.dart';
import '../../core/theme/delishop_text_styles.dart';
import '../../core/widgets/delishop_button.dart';
import '../../core/widgets/location_card.dart';
import '../../core/widgets/my_alert_dialog.dart';
import '../global/global_cubit.dart';
import '../product_full_screen/product_full_screen.dart';

class OrderSummeryScreen extends StatefulWidget {
  final Map<int, int> quants;

  /// quants[productId] = productQuantity...
  final OrderEntity order;

  const OrderSummeryScreen(
      {super.key, required this.order, required this.quants});

  @override
  State<OrderSummeryScreen> createState() => _OrderSummeryScreenState();
}

class _OrderSummeryScreenState extends State<OrderSummeryScreen> {
  TextEditingController descriptionController = TextEditingController();

  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GlobalCubit>().fetchAllLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 24),
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, globalState) {
            return BlocBuilder<CartCubit, CartState>(
              builder: (cartContext, cartState) {
                final locations = globalState.allLocations.data;
                final enabled = (locations != null &&
                    locations.isNotEmpty &&
                    selectedIndex != null &&
                    selectedIndex!.getIndex(locations) < locations.length &&
                    cartState.currentBalance.data != null &&
                    (cartState.currentBalance.data! >=
                        widget.order.getOrderPrice(widget.quants)));
                return BlocConsumer<OrderCubit, OrderState>(
                  builder: (context, state) {
                    final isLoading =
                        state.createOrderResponse.isLoading ?? false;
                    return DelishopButton(
                      isLoading: isLoading,
                      text: widget.order.getCheckoutButtonLabel(
                          context,
                          widget.quants,
                          context
                              .read<LangCodeCubit>()
                              .getCurrentLangCode(context)),
                      textColor: enabled
                          ? Colors.white
                          : Colors.black.withOpacity(0.5),
                      onPressed: enabled
                          ? () {
                              context.read<OrderCubit>().order(
                                  widget.order,
                                  widget.quants,
                                  globalState.allLocations.data![
                                      selectedIndex!.getIndex(locations)],
                                  descriptionController.text);
                              context.read<CartCubit>().waitAndReloadAllData();
                            }
                          : null,
                    );
                  },
                  listener: (context, state) {
                    state.createOrderResponse.when(
                      onLoading: () {},
                      onSuccess: (data) {
                        context
                            .read<CartCubit>()
                            .removeProductsFromDatabase(
                            widget.order.products
                                .map(
                                  (e) => e.id,
                            )
                                .toList());
                        context.pushReplacement(OrderInfoScreen(order: data, onPop: () {

                        },
                          showOk: true,
                        ));
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return MyAlertDialog(
                        //       title: "Ordered Successfully".tr(context),
                        //       details: widget.order.products
                        //           .map(
                        //             (e) => e.name,
                        //           )
                        //           .toList(),
                        //       isError: false,
                        //       onGotItClicked: () {
                        //
                        //         context.pop();
                        //       },
                        //     );
                        //   },
                        // );
                      },
                      onError: (domainError) {},
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      appBar: AppBar(title: Text("Confirmation".tr(context))),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 5,
                      child: SizedBox(
                          child: LocationCard(
                        onSelect: (int index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        selectedIndex: selectedIndex,
                      ))),
                  const Flexible(flex: 1, child: SizedBox(width: 16)),
                  const Flexible(
                      flex: 3, child: SizedBox(child: WalletLabel())),
                ],
              ),
              SizedBox(height: 16.h),
              Text("Mall".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 4.h),
              StoreInfo(store: widget.order.store),
              SizedBox(height: 16.h),
              Text("Products".tr(context),
                  style: Theme.of(context).textTheme.headlineSmall),
              ...widget.order.products.map((product) => OrderSummeryProductCard(
                    product: product,
                    quantity: widget.quants[product.id] ?? 1,
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground), // Sty
                    ),
                    Text(
                      "\$${widget.order.getOrderPrice(widget.quants)}",
                      // The price
                      style: DelishopTextStyles.font24OrangeBold
                          .copyWith(fontSize: 22),
                    )
                  ],
                ),
              ),
              DelishopTextField(
                textEditingController: descriptionController,
                labelText: "Your Notes".tr(context),
                minLines: 1,
              )
            ],
          ),
        ),
      )),
    );
  }
}
