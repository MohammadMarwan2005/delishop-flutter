import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/widgets/logout_button.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:delishop/feature/admin_role/admin_nav_host.dart';
import 'package:delishop/feature/global/global_cubit.dart';
import 'package:delishop/feature/product_full_screen/product_full_screen.dart';
import 'package:delishop/feature/store_role/my_products/cubit/my_products_cubit.dart';
import 'package:delishop/feature/store_role/my_store/cubit/my_store_cubit.dart';
import 'package:delishop/feature/store_role/my_store/my_store_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/delishop_text_styles.dart';
import '../admin_role/history/history_screen.dart';
import '../order/cubit/order_cubit.dart';
import '../order/my_orders_screen.dart';
import 'my_products/my_products_screen.dart';

class StoreNavHost extends StatelessWidget {
  const StoreNavHost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delishop Mall",
                  style: DelishopTextStyles.font32OrangeBold,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          )),
          body: mallViews[state.selectedBottomNavBarIndex],
          bottomNavigationBar: Container(
            color: DelishopColors.imageBackground,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BottomNavyBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              selectedIndex: state.selectedBottomNavBarIndex,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeInBack,
              containerHeight: 80,
              showInactiveTitle: false,
              itemPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              onItemSelected: (index) {
                context
                    .read<GlobalCubit>()
                    .changeSelectedBottomNavBarIndexIndex(index);
              },
              items: getStoreBottomNavBarItems(
                  state.selectedBottomNavBarIndex, context),
            ),
          ),
        );
      },
    );
  }
}

List<Widget> mallViews = [
  BlocProvider<OrderCubit>(
    create: (context) => getIt(),
    child: const MyOrdersScreen(),
  ),
  BlocProvider<MyStoreCubit>(
    create: (context) => getIt(),
    child: const MyStoreScreen(),
  ),
  BlocProvider<MyProductsCubit>(
    create: (context) => getIt(),
    child: const MyProductsScreen(),
  ),
];

List<BottomNavyBarItem> getStoreBottomNavBarItems(
    int selectedBottomNavBarIndex, BuildContext context) {
  return [
    BottomNavyBarItem(
      icon: Icon(selectedBottomNavBarIndex == 0
          ? Icons.shopping_bag
          : Icons.shopping_bag_outlined),
      title: Text("Orders".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    ),
    BottomNavyBarItem(
      icon: Icon(
          selectedBottomNavBarIndex == 1 ? Icons.info : Icons.info_outline),
      title: Text("Mall Info".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    ),
    BottomNavyBarItem(
      icon: Icon(
          selectedBottomNavBarIndex == 2 ? Icons.list : Icons.list_outlined),
      title: Text("Products".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    )
  ];
}

class StoreOrdersScreen extends StatelessWidget {
  const StoreOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Mall Orders"),
    );
  }
}
