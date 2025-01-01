import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:flutter/material.dart';

import '../../core/theme/delishop_text_styles.dart';
import '../account/account_screen.dart';
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
        title: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delishop", style: DelishopTextStyles.font32OrangeBold, textDirection: TextDirection.ltr,),
              Row(
                children: [
                  IconButton(
                      tooltip: "Notifications".tr(context),
                      onPressed: () {

                      }, icon: const Badge(label: Text("1"), offset: Offset(8, -10),child: Icon(Icons.notifications),)),
                  IconButton(onPressed: () {

                  }, icon: const Icon(Icons.shopping_cart)),
                ],
              )
            ],
          ),
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
            icon: const Icon(Icons.home),
            title: Text("Home".tr(context)),
            activeColor: DelishopColors.primary,
            inactiveColor: DelishopColors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.shopping_basket),
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
            icon: const Icon(Icons.favorite),
            title: Text("Favorite".tr(context)),
            activeColor: DelishopColors.primary,
            inactiveColor: DelishopColors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person),
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
