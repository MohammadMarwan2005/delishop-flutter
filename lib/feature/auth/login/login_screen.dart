import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:delishop/feature/auth/cubit/auth_cubit.dart';
import 'package:delishop/feature/auth/login/phone_number_and_password_form.dart';
import 'package:delishop/feature/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/delishop_text_styles.dart';
import '../../../core/widgets/suggestion_and_text_button.dart';
import '../widgets/auth_button.dart';
import '../widgets/forget_password_row.dart';
import 'login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Welcome Back".tr(context),
                          style: DelishopTextStyles.font24OrangeBold),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "We're excited to have you back, can't wait to see what you've been up to since you last logged in.".tr(context),
                        style: DelishopTextStyles.font14RegularGrey
                            .copyWith(height: 1.7),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    PhoneNumberAndPasswordForm(formKey: _formKey),
                    SizedBox(height: 16.h),
                    const ForgetPasswordRow(),
                    SizedBox(height: 16.h),
                    AuthButton(
                        onClick: () {
                          validateThenLogin(context, _formKey);
                        },
                        label: "Login".tr(context)),
                    SizedBox(height: 32.h),
                    SuggestionAndTextButton(
                      suggestionText: "Don't have an account?".tr(context),
                      buttonLabel: "Sign Up".tr(context),
                      onClick: () {
                        context.pushReplacement(RegisterScreen());
                      },
                    ),
                    SizedBox(height: 16.h),
                    const ToggleLangButton(),
                    SizedBox(height: 32.h),
                    const LoginBlocListener()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context, GlobalKey<FormState> loginFormKey) {
    final authCubit = context.read<AuthCubit>();
    if (/*context.read<AuthCubit>().*/loginFormKey.currentState!.validate()) {
      authCubit.login();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter valid values!".tr(context)),
        action: SnackBarAction(
          label: "Proceed".tr(context),
          onPressed: () {
            authCubit.login();
          },
        ),
      ));
    }
  }
}
