import 'package:delishop/core/helpers/validation_helper.dart';
import 'package:delishop/feature/auth/register/password_validation_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/delishop_text_field.dart';
import '../cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const RegisterForm({super.key, required this.formKey});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // late final _formKey;
  late bool hasLowerCase;
  late bool hasUpperCase;
  late bool hasNumber;
  late bool hasSpecialCharacter;
  late bool hasMinLength;

  @override
  void initState() {
    super.initState();
    // _formKey =
    // context.read<AuthCubit>().registerFormKey;
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
                      context.read<AuthCubit>().firstNameController,
                  labelText: "First Name",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid name.";
                    }
                    return null;
                  },
                  validate: () => widget.formKey.currentState!.validate(),
                ),
                SizedBox(height: 16.h),
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().lastNameController,
                  labelText: "Last Name",
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid name.";
                    }
                    return null;
                  },
                  validate: () => widget.formKey.currentState!.validate(),
                ),
                SizedBox(height: 16.h),
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().phoneNumberController,
                  labelText: "Phone Number",
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isPhoneNumberValid()) {
                      return "Please enter a valid phone number.";
                    }
                    return null;
                  },
                  validate: () => widget.formKey.currentState!.validate(),
                ),
                SizedBox(height: 16.h),
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().passwordController,
                  labelText: "Password",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isPasswordValid()) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                  isPassword: true,
                  onChanged: (value) {
                    validate();
                  },
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
                SizedBox(height: 16.h),
                DelishopTextField(
                  textEditingController:
                      context.read<AuthCubit>().passwordConfirmationController,
                  labelText: "Confirm Password",
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != context.read<AuthCubit>().passwordController.text) {
                      return "Passwords don't match!";
                    }
                    if (!value.isPasswordValid()) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                  isPassword: true,
                  validate: () => widget.formKey.currentState!.validate(),
                ),
              ],
            ));
      },
    );
  }
}
