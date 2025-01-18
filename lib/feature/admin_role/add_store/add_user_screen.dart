import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/logout_button.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:delishop/feature/admin_role/add_store/add_user_button.dart';
import 'package:delishop/feature/admin_role/add_store/cubit/add_store_cubit.dart';
import 'package:delishop/feature/auth/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/api_consts.dart';
import '../../../core/theme/delishop_text_styles.dart';
import '../../auth/register/register_screen.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  int roleId = 3;

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
                    child: Text("Create Account".tr(context),
                        style: DelishopTextStyles.font24OrangeBold),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "As an admin, you can add a new user, mall, or another admin to the system. Use the form below to input the required details and manage your platform efficiently."
                          .tr(context),
                      style: DelishopTextStyles.font14RegularGrey
                          .copyWith(height: 1.7),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  RegisterForm(formKey: _formKey, isAdmin: true),
                  SizedBox(height: 16.h),
                  UserRoleSelector(
                    selectedUserId: roleId,
                    onRoleSelected: (userId) {
                      setState(() {
                        roleId = userId;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  AddUserButton(
                      onClick: () {
                        validateThenAddUser(context, _formKey);
                      },
                      label: "Sign Up".tr(context)),
                  SizedBox(height: 32.h),
                  const ToggleLangButton(),
                  SizedBox(height: 16.h),
                  const LogoutButton(),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  void validateThenAddUser(BuildContext context, GlobalKey<FormState> formKey) {
    final authCubit = context.read<AddStoreCubit>();
    validateThenDo(
      context,
      formKey,
      () {
        authCubit.createStore(roleId: roleId);
      },
    );
  }
}

class UserRoleSelector extends StatelessWidget {
  final int? selectedUserId;
  final Function(int roleId) onRoleSelected;

  const UserRoleSelector({
    super.key,
    required this.selectedUserId,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    final roles = {
      RoleIds.superAdmin: 'Super Admin'.tr(context),
      RoleIds.mall: 'Mall'.tr(context),
      RoleIds.user: 'User'.tr(context),
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: PopupMenuButton<int>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onSelected: (value) => onRoleSelected(value),
        itemBuilder: (context) {
          return roles.entries.map(
            (entry) {
              return PopupMenuItem<int>(
                value: entry.key,
                child: Row(
                  children: [
                    entry.key == selectedUserId
                        ? const Icon(Icons.check, color: Colors.green)
                        : const SizedBox(width: 24),
                    const SizedBox(width: 8),
                    Text(entry.value),
                  ],
                ),
              );
            },
          ).toList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedUserId != null
                    ? roles[selectedUserId] ?? "Select Role".tr(context)
                    : "Select Role".tr(context),
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
