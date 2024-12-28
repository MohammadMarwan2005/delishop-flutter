import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/helpers/validation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/delishop_text_field.dart';
import '../cubit/auth_cubit.dart';
import '../register/password_validation_info.dart';

class PhoneNumberAndPasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PhoneNumberAndPasswordForm({super.key, required this.formKey});

  @override
  State<PhoneNumberAndPasswordForm> createState() =>
      _PhoneNumberAndPasswordFormState();
}

class _PhoneNumberAndPasswordFormState
    extends State<PhoneNumberAndPasswordForm> {
  // late final _formKey;
  late bool hasLowerCase;
  late bool hasUpperCase;
  late bool hasNumber;
  late bool hasSpecialCharacter;
  late bool hasMinLength;

  @override
  void initState() {
    super.initState();
    // _formKey = context.read<AuthCubit>().loginFormKey;
    validate();
  }

  void validate() {
    setState(() {
      String currentValue = context.read<AuthCubit>().passwordController.text;
      hasLowerCase = currentValue.hasLowerCase();
      hasUpperCase = currentValue.hasUpperCase();
      hasNumber = currentValue.hasNumber();
      hasSpecialCharacter = currentValue.hasSpecialCharacter();
      hasMinLength = currentValue.hasMinLength();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
            key: widget.formKey,
            child: Column(
              children: [
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().phoneNumberController,
                  labelText: "Phone Number".tr(context),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isPhoneNumberValid()) {
                      return "Please enter a valid phone number.".tr(context);
                    }
                    return null;
                  },
                  validate: () => widget.formKey.currentState!.validate(),
                ),
                SizedBox(height: 16.h),
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().passwordController,
                  labelText: "Password".tr(context),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isPasswordValid()) {
                      return "Please enter a valid password".tr(context);
                    }
                    return null;
                  },
                  onChanged: (value) {
                    validate();
                  },
                  isPassword: true,
                  validate: () => widget.formKey.currentState!.validate(),
                ),
                SizedBox(height: 16.h),
                // Validation
                PasswordValidationInfo(
                    hasLowerCase: hasLowerCase,
                    hasUpperCase: hasUpperCase,
                    hasNumber: hasNumber,
                    hasSpecialCharacter: hasSpecialCharacter,
                    hasMinLength: hasMinLength),
              ],
            ));
      },
    );
  }
}
