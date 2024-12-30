import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/feature/account/account_screen.dart';
import 'package:delishop/feature/account/cubit/account_cubit.dart';
import 'package:delishop/feature/auth/register/register_screen.dart';
import 'package:delishop/feature/home/home_cubit.dart';
import 'package:delishop/feature/home/home_screen.dart';
import 'package:delishop/feature/onboarding/get_page_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../feature/onboarding/onboarding_screen.dart';

Future<Widget> getFirstRoute(BuildContext context) async {
  UserDataRepo userDataRepo = getIt();
  if (await userDataRepo.hasToken()) {
    return BlocProvider<HomeCubit>(
        create: (context) => getIt(), child: const HomeScreen());
  }
  if (userDataRepo.hasOnboarded()) return RegisterScreen();
  return OnboardingScreen(
    onDone: () {
      userDataRepo.setOnboarded();
    },
  );
}
