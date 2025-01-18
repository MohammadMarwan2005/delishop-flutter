import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/widgets/logout_button.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:delishop/feature/admin_role/add_store/cubit/add_store_cubit.dart';
import 'package:delishop/feature/admin_role/deposit_money/cubit/deposit_money_cubit.dart';
import 'package:delishop/feature/admin_role/history/cubit/history_cubit.dart';
import 'package:delishop/feature/global/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/delishop_text_styles.dart';
import 'add_store/add_user_screen.dart';
import 'deposit_money/deposit_money_screen.dart';
import 'history/history_screen.dart';

class AdminNavHost extends StatelessWidget {
  const AdminNavHost({super.key});

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
                  "Delishop Dashboard",
                  style: DelishopTextStyles.font32OrangeBold,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          )),
          body: adminViews[state.selectedBottomNavBarIndex],
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
              items: getAdminBottomNavBarItems(
                  state.selectedBottomNavBarIndex, context),
            ),
          ),
        );
      },
    );
  }
}

List<Widget> adminViews = [
  BlocProvider<DepositMoneyCubit>(
    create: (context) => getIt(),
    child: DepositMoneyScreen(),
  ),
  BlocProvider<AddStoreCubit>(
    create: (context) => getIt(),
    child: const AddUserScreen(),
  ),
  BlocProvider<HistoryCubit>(
    create: (context) => getIt(),
    child: const HistoryScreen(),
  ),

];

List<BottomNavyBarItem> getAdminBottomNavBarItems(
    int selectedBottomNavBarIndex, BuildContext context) {
  return [
    BottomNavyBarItem(
      icon: Icon(selectedBottomNavBarIndex == 0
          ? Icons.attach_money
          : Icons.attach_money),
      title: Text("DepositBottom".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    ),
    BottomNavyBarItem(
      icon: Icon(selectedBottomNavBarIndex == 1
          ? Icons.add_business
          : Icons.add_business_outlined),
      title: Text("Add Mall".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    ),
    BottomNavyBarItem(
      icon:
          Icon(selectedBottomNavBarIndex == 2 ? Icons.history : Icons.history),
      title: Text("History".tr(context)),
      activeColor: DelishopColors.primary,
      inactiveColor: DelishopColors.grey,
    ),
  ];
}

