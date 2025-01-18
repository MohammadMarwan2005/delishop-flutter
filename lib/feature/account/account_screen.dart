import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../core/widgets/logout_button.dart';
import '../../core/widgets/toggle_lang_button.dart';
import 'cubit/account_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Account".tr(context))),
      body: Column(
        children: [
          SafeArea(
            child: BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (firstName, lastName, token) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(IconlyLight.profile),
                        Text("${"Welcome, ".tr(context)}$firstName $lastName!", style: Theme.of(context).textTheme.titleLarge,),
                        SizedBox(height: 16.h),
                        Text("${"Your token is:".tr(context)}\n$token"),
                      ],
                    ),
                  );
                },
                error: (error) {
                  return Center(child: Text("Something went Wrong, ".tr(context) + error.message));
                },
              );
            }),
          ),
          LogoutButton(),
          ToggleLangButton()
        ],
      ),
    );
  }
}
