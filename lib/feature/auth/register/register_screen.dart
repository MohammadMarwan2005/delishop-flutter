import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/widgets/suggestion_and_text_button.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/auth/login/login_bloc_listener.dart';
import 'package:delishop/feature/auth/login/login_screen.dart';
import 'package:delishop/feature/auth/register/register_form.dart';
import 'package:delishop/feature/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/delishop_text_styles.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Create Account",
                    style: DelishopTextStyles.font24OrangeBold),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: DelishopTextStyles.font14RegularGrey
                      .copyWith(height: 1.7),
                ),
              ),
              SizedBox(height: 36.h),
              RegisterForm(formKey: _formKey),
              SizedBox(height: 16.h),
              AuthButton(
                  onClick: () {
                    validateThenRegister(context, _formKey);
                  },
                  label: "Sign Up"),
              SizedBox(height: 32.h),
              SuggestionAndTextButton(
                suggestionText: "Already have an account?",
                buttonLabel: "Login",
                onClick: () {
                  context.pushReplacement(LoginScreen());
                },
              ),
              SizedBox(height: 32.h),
              const LoginBlocListener()
            ],
          ),
        ),
      )),
    );
  }

  void validateThenRegister(BuildContext context, GlobalKey<FormState> registerFormKey) {
    final authCubit = context.read<AuthCubit>();
    if (/*context.read<AuthCubit>().*/registerFormKey.currentState!.validate()) {
      authCubit.register();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Enter valid values!"),
        action: SnackBarAction(
          label: "Proceed",
          onPressed: () {
            authCubit.register();
          },
        ),
      ));
    }
  }
}
