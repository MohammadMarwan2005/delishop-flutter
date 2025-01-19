import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/lang/lang_code_cubit.dart';
import 'package:delishop/core/widgets/delishop_button.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
import 'package:delishop/feature/cart/widgets/cart_product_card.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:delishop/feature/order/order_summery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';

import '../../../core/widgets/error_message.dart';
import '../../../core/widgets/no_result_message.dart';
import '../cart_screen.dart';

class TabbedCartList extends StatefulWidget {
  const TabbedCartList({super.key});

  @override
  State<TabbedCartList> createState() => _TabbedCartListState();
}

class _TabbedCartListState extends State<TabbedCartList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext outerContext) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.orderEntities.when(
          onLoading: () {
            return const Loading();
          },
          onSuccess: (data) {
            if (data.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NoResultMessage(
                    messageLabel: "No products found in the cart!".tr(context),
                    buttonLabel: "Try Again".tr(context),
                    onButtonClicked: () {
                      context.read<CartCubit>().fetchCartContent();
                    },
                  ),
                  const Flexible(child: SizedBox(height: 100))
                ],
              );
            }
            final price =
                data[selectedIndex.getIndex(data)].getOrderPrice(state.productsQuants);
            final bool enabled = (state.currentBalance.data ?? 0) >= price;
            return Scaffold(
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: DelishopButton(
                    onPressed: enabled
                        ? () {
                            context.push(BlocProvider<OrderCubit>(
                              create: (context) => OrderCubit(getIt(), getIt()),
                              child: OrderSummeryScreen(
                                  order: data[selectedIndex.getIndex(data)],
                                  quants: state.productsQuants),
                            ));
                            // todo: go to the checkout screen (confirm wallet money is enough, confirm location is not null, order summery + delivery taxes, checkout order button)
                            // if the wallet is enough, and the location is not null, and the user clicks order, that will trigger the order endpoint, and will successfully consider his order as pending...
                            // that pending order will be shown in the mall account dashboard, and he can accept it, with an estimated delivery time, or can reject it with a rejection reason
                            // every update should send a notification to both the user and the mall account...
                            print(
                                "<---------------------------------------------------------------------------------------------------------------------------------");
                            print(
                                "Order: \n ${data[selectedIndex.getIndex(data)].products} \n from ${data[selectedIndex.getIndex(data)].store.name} for \$${data[selectedIndex.getIndex(data)].getOrderPrice(state.productsQuants)}");
                            print(
                                "--------------------------------------------------------------------------------------------------------------------------------->");
                          }
                        : null,
                    text:
                        // "Checkout from ${data[selectedIndex.getIndex(data)].store.name} for \$${data[selectedIndex.getIndex(data)].getOrderPrice(state.productsQuants)}",
                        data[selectedIndex.getIndex(data)]
                            .getCheckoutButtonLabel(
                                context,
                                state.productsQuants,
                                context
                                    .read<LangCodeCubit>()
                                    .getCurrentLangCode(context)),
                    textColor:
                        enabled ? Colors.white : Colors.black.withOpacity(0.5)),
              ),
              body: DefaultTabController(
                  initialIndex: selectedIndex.getIndex(data),
                  length: data.length,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (value) {
                          setState(() {
                            selectedIndex = value;
                          });
                        },
                        isScrollable: true,
                        tabs: data.map((item) {
                          return Tab(text: item.store.name);
                        }).toList(),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: data.map((item) {
                            return RefreshIndicator(
                              onRefresh: () async {
                                context.read<CartCubit>().fetchCartContent();
                              },
                              child: ListView.builder(
                                itemCount: item.products.length,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: CartProductCard(
                                    quantity: state.productsQuants[
                                            item.products[index].id] ??
                                        1,
                                    onQuantityChanged: (newQuan) {
                                      context
                                          .read<CartCubit>()
                                          .onQuantityChanged(
                                              item.products[index].id, newQuan);
                                    },
                                    product: item.products[index],
                                    onDismiss: (direction) {
                                      setupConfirmationSnackBar(context, () {
                                        outerContext
                                            .read<CartCubit>()
                                            .addProductToCart(
                                                item.products[index],
                                                increaseBadge: false);
                                      }, item.products[index].name,
                                          padding: const EdgeInsets.only(
                                              bottom: 100.0));
                                      context.read<CartCubit>().removeFromCart(
                                          item.products[index].id);
                                    },
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )),
            );
          },
          onError: (domainError) {
            return ErrorMessage(
              message: domainError.message,
              onTryAgain: () {
                context.read<CartCubit>().fetchCartContent();
              },
            );
          },
        );
      },
    );
  }
}

extension IndexHelper on int {
  int getIndex(List<dynamic> items) {
    if (this >= items.length) return items.length - 1;
    return this;
  }
}
