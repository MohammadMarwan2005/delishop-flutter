import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/feature/account/cubit/account_cubit.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di_get_it.dart';
import '../../account/account_screen.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              success: (successResponseModel) {
                context.pushReplacement(BlocProvider<AccountCubit>(
                    create: (context) => getIt(),
                    child: const AccountScreen()));
              },
              error: (error) {
                context.setupErrorState(error); // this
              },
              loading: () {});
        },
        child: const SizedBox.shrink());
  }

}
