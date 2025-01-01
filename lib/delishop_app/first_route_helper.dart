import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/feature/account/cubit/account_cubit.dart';
import 'package:delishop/feature/auth/register/register_screen.dart';
import 'package:delishop/feature/bottom_nav_host/bottom_nav_host.dart';
import 'package:delishop/feature/favorite/favorite_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/home/home_cubit.dart';
import '../feature/onboarding/onboarding_screen.dart';

Future<Widget> getFirstRoute(BuildContext context) async {
  UserDataRepo userDataRepo = getIt();
  if (await userDataRepo.hasToken()) {
    return MultiBlocProvider(providers: [
      BlocProvider<HomeCubit>(create: (context) => getIt()),
      BlocProvider<FavoriteCubit>(create: (context) => getIt()),
      BlocProvider<AccountCubit>(create: (context) => getIt()),
    ], child: const BottomNavHost());
  }
  if (userDataRepo.hasOnboarded()) return RegisterScreen();
  return OnboardingScreen(
    onDone: () {
      userDataRepo.setOnboarded();
    },
  );
}
