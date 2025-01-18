import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/helpers/validation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/admin_role/add_store/cubit/add_store_cubit.dart';
import 'package:delishop/feature/auth/register/password_validation_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/delishop_text_field.dart';
import '../cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final bool isAdmin;

  const RegisterForm({super.key, required this.formKey, this.isAdmin = false});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late bool hasLowerCase;
  late bool hasUpperCase;
  late bool hasNumber;
  late bool hasSpecialCharacter;
  late bool hasMinLength;

  @override
  void initState() {
    super.initState();
    validate();
  }

  void validate() {
    setState(() {
      final RegisterAble cubit = (widget.isAdmin)
          ? context.read<AddStoreCubit>()
          : context.read<AuthCubit>();
      String currentValue = cubit.getPasswordController().text;
      hasLowerCase = currentValue.hasLowerCase();
      hasUpperCase = currentValue.hasUpperCase();
      hasNumber = currentValue.hasNumber();
      hasSpecialCharacter = currentValue.hasSpecialCharacter();
      hasMinLength = currentValue.hasMinLength();
    });
  }

  @override
  Widget build(BuildContext context) {
    final RegisterAble cubit = (widget.isAdmin)
        ? context.read<AddStoreCubit>()
        : context.read<AuthCubit>();

    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            DelishopTextField(
              textEditingController: cubit.getFirstNameController(),
              labelText: "First Name".tr(context),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid name.".tr(context);
                }
                return null;
              },
              validate: () => widget.formKey.currentState!.validate(),
            ),
            SizedBox(height: 16.h),
            DelishopTextField(
              textEditingController: cubit.getLastNameController(),
              labelText: "Last Name".tr(context),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid name.".tr(context);
                }
                return null;
              },
              validate: () => widget.formKey.currentState!.validate(),
            ),
            SizedBox(height: 16.h),
            DelishopTextField(
              textEditingController: cubit.getPhoneNumberController(),
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
              textEditingController: cubit.getPasswordController(),
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
              textEditingController: cubit.getPasswordConfirmationController(),
              labelText: "Confirm Password".tr(context),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value != cubit.getPasswordConfirmationController().text) {
                  return "Passwords don't match!".tr(context);
                }
                if (!value.isPasswordValid()) {
                  return "Please enter a valid password".tr(context);
                }
                return null;
              },
              isPassword: true,
              validate: () => widget.formKey.currentState!.validate(),
            ),
          ],
        ));
  }
}
