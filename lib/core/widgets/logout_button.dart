import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/global/global_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/auth/cubit/auth_cubit.dart';
import '../../feature/auth/login/login_screen.dart';
import 'delishop_text_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DelishopTextButton(onClick: () {
      context.read<GlobalCubit>().resetBottomNavIndexIndex();
      context.read<AuthCubit>().logout();
      context.removeAndPush(LoginScreen());
    }, label: "Logout".tr(context));
  }
}
