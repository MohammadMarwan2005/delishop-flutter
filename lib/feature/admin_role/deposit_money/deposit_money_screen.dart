import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/validation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/delishop_button.dart';
import 'package:delishop/core/widgets/delishop_text_field.dart';
import 'package:delishop/feature/admin_role/deposit_money/cubit/deposit_money_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/delishop_text_styles.dart';
import '../../../core/widgets/my_alert_dialog.dart';

class DepositMoneyScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  DepositMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Deposit Money".tr(context),
                                  style: DelishopTextStyles.font24OrangeBold),
                            ),
                            SizedBox(height: 8.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Specify the amount to deposit into the user's account."
                                    .tr(context),
                                style: DelishopTextStyles.font14RegularGrey
                                    .copyWith(height: 1.7),
                              ),
                            ),
                            SizedBox(height: 36.h),
                            DelishopTextField(
                              labelText: "Phone Number".tr(context),
                              textEditingController: context
                                  .read<DepositMoneyCubit>()
                                  .phoneNumberController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.isPhoneNumberValid()) {
                                  return "Please enter a valid phone number."
                                      .tr(context);
                                }
                                return null;
                              },
                              validate: () => _formKey.currentState!.validate(),
                            ),
                            SizedBox(height: 16.h),
                            DelishopTextField(
                              labelText: "Amount".tr(context),
                              textEditingController: context
                                  .read<DepositMoneyCubit>()
                                  .amountController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    double.tryParse(value) == null) {
                                  return "Please enter a valid amount."
                                      .tr(context);
                                }
                                return null;
                              },
                              validate: () => _formKey.currentState!.validate(),
                            ),
                            SizedBox(height: 16.h),
                          ],
                        )),
                    BlocConsumer<DepositMoneyCubit, DepositMoneyState>(
                      builder: (context, state) {
                        var isLoading = state.when(initial: () {
                          return false;
                        }, success: (successData) {
                          return false;
                        }, error: (error) {
                          return false;
                        }, loading: () {
                          return true;
                        });
                        return DelishopButton(
                            isLoading: isLoading,
                            onPressed: () {
                              validateThenDeposit(context, _formKey);
                            },
                            text: "Deposit".tr(context));
                      },
                      listener: (context, state) {
                        state.when(
                            initial: () {},
                            success: (successResponseModel) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MyAlertDialog(
                                      title: "Deposited Successfully!",
                                      details: [
                                        "The user balance now is ${successResponseModel.balance}"
                                      ],
                                      isError: false);
                                },
                              );
                            },
                            error: (error) {
                              context.setupErrorState(error);
                            },
                            loading: () {});
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDeposit(
      BuildContext context, GlobalKey<FormState> loginFormKey) {
    final cubit = context.read<DepositMoneyCubit>();
    if (loginFormKey.currentState!.validate()) {
      cubit.depositMoney();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter valid values!".tr(context)),
        action: SnackBarAction(
          label: "Proceed".tr(context),
          onPressed: () {
            cubit.depositMoney();
          },
        ),
      ));
    }
  }
}
