import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/feature/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/delishop_text_styles.dart';
import '../account/account_screen.dart';
import '../cart/cubit/cart_cubit.dart';
import '../favorite/favorite_screen.dart';
import '../home/home_screen.dart';

class BottomNavHost extends StatefulWidget {
  static const routeName = '/BottomNavyBarPage';

  const BottomNavHost({super.key});

  @override
  _BottomNavHostState createState() => _BottomNavHostState();
}

//🔳 Bottom Nav Bar (Home-Orders-Search-Favorites-Profile)
class _BottomNavHostState extends State<BottomNavHost> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    children: [
                      // CircleAvatar(
                      // backgroundColor: const Color(0xFF979797).withOpacity(0.1),
                      // child:
                      IconButton(
                          tooltip: "Notifications".tr(context),
                          onPressed: () {},
                          color: Colors.black,
                          icon: const Icon(Icons.notifications_none).getBadged(1)),
                      // ),
                      IconButton(
                        tooltip: "Cart".tr(context),
                        onPressed: () {
                          context.push(const CartScreen());
                          context.read<CartCubit>().clearBadge();
                        },
                        icon: const Icon(Icons.shopping_basket_outlined).getBadged(
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
      body: views[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        containerHeight: 67,
        itemPadding: const EdgeInsets.all(10.0),
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(currentIndex==0 ? Icons.home : Icons.home_outlined),
            title: Text("Home".tr(context)),
            activeColor: DelishopColors.primary,
            inactiveColor: DelishopColors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(currentIndex== 1? Icons.shopping_bag : Icons.shopping_bag_outlined),
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
            icon: Icon( currentIndex==3 ? Icons.favorite : Icons.favorite_outline),
            title: Text("Favorite".tr(context)),
            activeColor: DelishopColors.primary,
            inactiveColor: DelishopColors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(currentIndex==4 ? Icons.person : Icons.person_outline),
            title: Text("Profile".tr(context)),
            activeColor: DelishopColors.primary,
            inactiveColor: DelishopColors.grey,
          ),
        ],
      ),
    );
  }
}

List<Widget> views = [
  const HomeScreen(),
  const MyOrdersScreen(),
  const SearchScreen(),
  const FavoriteScreen(),
  const AccountScreen()
];

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("My Orders"),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}

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
