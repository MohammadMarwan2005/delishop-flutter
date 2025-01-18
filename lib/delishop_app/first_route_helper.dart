import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/feature/admin_role/admin_nav_host.dart';
import 'package:delishop/feature/auth/register/register_screen.dart';
import 'package:delishop/feature/store_role/store_nav_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/account/cubit/account_cubit.dart';
import '../feature/bottom_nav_host/bottom_nav_host.dart';
import '../feature/favorite/favorite_cubit.dart';
import '../feature/home/home_cubit.dart';
import '../feature/onboarding/onboarding_screen.dart';

Future<Widget> getFirstRoute(BuildContext context) async {
  UserDataRepo userDataRepo = getIt();
  if (await userDataRepo.hasToken()) {
    final roleId = userDataRepo.getInt(DataAccessKeys.roleIdKey);
    if (roleId != null) {
      if(context.mounted) {
        return roleId.getNavHost();
      }
    }
  }
  if (userDataRepo.hasOnboarded()) return RegisterScreen();
  return OnboardingScreen(
    onDone: () {
      userDataRepo.setOnboarded();
    },
  );
}

extension NavHostHelper on int {
  Widget getNavHost(/*BuildContext context*/) {
    print("Detecting Role: ${this}");
    return whenRole<Widget>(superAdmin: () {
      // showSnackBar(context);
      return const AdminNavHost();
    }, mall: () {
      // showSnackBar(context);
      return const StoreNavHost();
    }, user: () {
      // showSnackBar(context);
      return MultiBlocProvider(providers: [
        BlocProvider<HomeCubit>(create: (context) => getIt()),
        BlocProvider<FavoriteCubit>(create: (context) => getIt()),
        BlocProvider<AccountCubit>(create: (context) => getIt()),
      ], child: const BottomNavHost());
    });
  }

  void showSnackBar(BuildContext context) {
    final role = whenRole<String>(
        superAdmin: () => "Admin", mall: () => "Mall", user: () => "User");
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("You logged in as $role")));
  }
}
