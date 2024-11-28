import 'package:delishop/core/data/domain_error_model.dart';
import 'package:delishop/core/helpers/error_handling_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/home_screen.dart';
import '../widgets/error_details.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              success: (successResponseModel) {
                context.pushReplacement(const HomeScreen());
              },
              error: (error) {
                setupErrorState(context, error); // this
              },
              loading: () {});
        },
        child: const SizedBox.shrink());
  }

  void setupErrorState(BuildContext context, DomainErrorModel error) {
    String title = error.message;
    List<String> details = error.details?? [];

    error.when(
        onUnprocessableEntity: () {
          title = "Unproccessable Entity!";
        },
        onUnauthorized: () {
          title = "Wrong Credentials!";
          details = ["Check your information!"];
        },
        onNoInternet: () {
          title = "No Internet Connection!";
          details = ["Check you connection"];
        },
        onUnknown: () {
          title = "Opps!";
          details = ["Unknown Error!"];
        });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        title: Text(title),
        content: ErrorDetails(details: details),
        actions: [
          DelishopTextButton(
            onClick: () {
              context.pop();
            },
            label: "Got it!",
          ),
        ],
      ),
    );
  }
}
