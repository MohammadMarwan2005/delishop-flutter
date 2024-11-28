import 'package:delishop/core/data/repo/user_data_repo.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/feature/auth/register/register_screen.dart';
import 'package:delishop/feature/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

Future<Widget> getFirstRoute() async {
  UserDataRepo userDataRepo = getIt();
  if (await userDataRepo.hasToken()) {
    return const HomeScreen();
  }
  return RegisterScreen();
}
