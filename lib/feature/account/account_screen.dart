import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:delishop/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../core/di/di_get_it.dart';
import '../home/home_cubit.dart';
import 'cubit/account_cubit.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Account"), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
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
                        Text("Welcome, $firstName $lastName!", style: Theme.of(context).textTheme.titleLarge,),
                        SizedBox(height: 16.h),
                        Text("Your token is: \n$token"),
                      ],
                    ),
                  );
                },
                error: (error) {
                  return Center(child: Text("Something went Wrong, ${error.message}"));
                },
              );
            }),
          ),
          DelishopTextButton(onClick: () {
            context.push(BlocProvider<HomeCubit>(create: (context) => getIt(), child: const HomeScreen()));
          }, label: "Go to Home")
        ],
      ),
    );
  }
}
