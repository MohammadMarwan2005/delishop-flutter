import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/delishop_colors.dart';
import '../../core/widgets/error_message.dart';
import '../../core/widgets/loading.dart';
import '../cart/cubit/cart_cubit.dart';

class WalletLabel extends StatefulWidget {
  const WalletLabel({super.key});

  @override
  State<WalletLabel> createState() => _WalletLabelState();
}

class _WalletLabelState extends State<WalletLabel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().fetchMyBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return state.currentBalance.when(
          onLoading: () {
            return Loading(
              height: 40.h,
              width: 40.h,
            );
          },
          onSuccess: (data) {
            return InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {
                context.read<CartCubit>().fetchMyBalance();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("\$ ",
                        style: TextStyle(color: Colors.green, fontSize: 22)),
                    Text("$data",
                        style: DelishopTextStyles.font24OrangeBold
                            .copyWith(fontSize: 22)),
                  ],
                ),
              ),
            );
          },
          onError: (domainError) {
            return Column(
              children: [
                Text(
                  domainError.getMessage(context),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                InkWell(
                  onTap: () {
                    context.read<CartCubit>().fetchMyBalance();
                  },
                  child: Text(
                    "Try Again".tr(context),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: DelishopColors.primary),
                  ),
                ),
              ],
            );
            // return ErrorMessage(
            //   message: domainError.getMessage(context),
            //   onTryAgain: () {
            //     context.read<CartCubit>().fetchMyBalance();
            //   },
            // );
          },
        );
      },
    );
  }
}
