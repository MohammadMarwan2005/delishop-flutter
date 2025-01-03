import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/cart/widgets/tabbed_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/lang/lang_code_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<CartCubit>().logViewFav();
    });
  }

  @override
  Widget build(BuildContext outerContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart".tr(outerContext)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: const TabbedCartList(),
      )),
    );
  }
}

void setupConfirmationSnackBar(
    BuildContext context, Function() onUndo, String productName,
    {EdgeInsetsGeometry? padding}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: (padding == null) ? null : SnackBarBehavior.floating,
    margin: padding,
    duration: const Duration(seconds: 2),
    content: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(productName.getRemovedFromCartMessage(
            context.read<LangCodeCubit>().getCurrentLangCode(context))),
        SnackBarAction(
          label: "Undo".tr(context),
          onPressed: onUndo,
        ),
      ],
    ),
    dismissDirection: DismissDirection.horizontal,
  ));
}
