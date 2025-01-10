import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/feature/bottom_nav_host/wallet_label.dart';
import 'package:delishop/feature/cart/cart_screen.dart';
import 'package:delishop/feature/favorite/favorite_cubit.dart';
import 'package:delishop/feature/global/global_cubit.dart';
import 'package:delishop/feature/order/cubit/order_cubit.dart';
import 'package:delishop/feature/profile/cubit/profile_cubit.dart';
import 'package:delishop/feature/profile/profile_screen.dart';
import 'package:delishop/feature/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../core/theme/delishop_text_styles.dart';
import '../account/account_screen.dart';
import '../cart/cubit/cart_cubit.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_screen.dart';
import '../order/my_orders_screen.dart';
import '../search/search_screen.dart';

class BottomNavHost extends StatelessWidget {
  const BottomNavHost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delishop",
                        style: DelishopTextStyles.font32OrangeBold,
                        textDirection: TextDirection.ltr,
                      ),
                      const WalletLabel(),
                      Row(
                        children: [
                          // CircleAvatar(
                          // backgroundColor: const Color(0xFF979797).withOpacity(0.1),
                          // child:
                          IconButton(
                              tooltip: "Notifications".tr(context),
                              onPressed: () {},
                              color: Colors.black,
                              icon: const Icon(Icons.notifications_none)
                                  .getBadged(1)),
                          // ),
                          IconButton(
                            tooltip: "Cart".tr(context),
                            onPressed: () {
                              context.push(const CartScreen());
                              context.read<CartCubit>().clearBadge();
                            },
                            icon: const Icon(Icons.shopping_basket_outlined)
                                .getBadged(
                                    context.read<CartCubit>().state.badgeCount),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          body: views[state.selectedBottomNavBarIndex],
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
              itemPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              onItemSelected: (index) {
                context
                    .read<GlobalCubit>()
                    .changeSelectedBottomNavBarIndexIndex(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(state.selectedBottomNavBarIndex == 0
                      ? Icons.home
                      : Icons.home_outlined),
                  title: Text("Home".tr(context)),
                  activeColor: DelishopColors.primary,
                  inactiveColor: DelishopColors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(state.selectedBottomNavBarIndex == 1
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined),
                  title: Text("Orders".tr(context)),
                  activeColor: DelishopColors.primary,
                  inactiveColor: DelishopColors.grey,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.search),
                  title: Text("Search".tr(context)),
                  activeColor: DelishopColors.primary,
                  inactiveColor: DelishopColors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(state.selectedBottomNavBarIndex == 3
                      ? Icons.favorite
                      : Icons.favorite_outline),
                  title: Text("Favorite".tr(context)),
                  activeColor: DelishopColors.primary,
                  inactiveColor: DelishopColors.grey,
                ),
                BottomNavyBarItem(
                  icon: Icon(state.selectedBottomNavBarIndex == 4
                      ? Icons.person
                      : Icons.person_outline),
                  title: Text("Profile".tr(context)),
                  activeColor: DelishopColors.primary,
                  inactiveColor: DelishopColors.grey,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Widget> views = [
  const HomeScreen(),
  BlocProvider<OrderCubit>(
    create: (context) => getIt(),
    child: const MyOrdersScreen(),
  ),
  BlocProvider<SearchCubit>(
    create: (context) => getIt(),
    child: const SearchScreen(),
  ),
  BlocProvider<FavoriteCubit>(
    create: (context) => getIt(),
    child: const FavoriteScreen(),
  ),
  BlocProvider<ProfileCubit>(
    create: (context) => getIt(),
    child: const ProfileScreen(),
  )
];

extension BadgeWidgetHelper on Icon {
  Widget getBadged(int label) {
    if (label != 0) {
      return Badge(
        label: Text(label.toString()),
        offset: const Offset(8, -10),
        child: this,
      );
    }
    return this;
  }
}
