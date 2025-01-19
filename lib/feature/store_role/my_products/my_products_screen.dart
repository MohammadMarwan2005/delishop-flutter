import 'package:delishop/core/data/api_consts.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/no_result_message.dart';
import 'package:delishop/feature/store_role/add_update_product/add_update_product_screen.dart';
import 'package:delishop/feature/store_role/add_update_product/cubit/add_update_product_cubit.dart';
import 'package:delishop/feature/store_role/my_products/cubit/my_products_cubit.dart';
import 'package:delishop/feature/store_role/my_products/my_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/item_grid_view.dart';
import '../../../core/widgets/loading.dart';

class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push(BlocProvider<AddUpdateProductCubit>(
            create: (context) =>
                AddUpdateProductCubit(getIt(), getIt(), constProduct),
            child: const AddUpdateProductScreen(),
          ));
        },
      ),
      appBar: AppBar(
        title: Text("My Products".tr(context)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: BlocBuilder<MyProductsCubit, MyProductsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Loading(),
                loading: () => const Loading(),
                success: (products) {
                  return ItemGridView(
                    items: products,
                    cardBuilder: (item) => MyProductCard(product: item),
                  );
                },
                error: (errorModel) {
                  if (errorModel.code == StatusCodes.notFound) {
                    return NoResultMessage(
                      buttonLabel: "Try Again".tr(context),
                      messageLabel:
                          "You didn't publish any product yet!".tr(context),
                      onButtonClicked: () {
                        context.read<MyProductsCubit>().fetchMyProducts();
                      },
                    );
                  }
                  return ErrorMessage(
                    message: errorModel.getMessage(context),
                    onTryAgain: () {
                      context.read<MyProductsCubit>().fetchMyProducts();
                    },
                  );
                },
              );
            },
          ),
        ),
      )),
    );
  }
}
