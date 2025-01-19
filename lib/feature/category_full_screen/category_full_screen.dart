import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/core/widgets/no_result_message.dart';
import 'package:delishop/feature/category_full_screen/category_cubit.dart';
import 'package:delishop/feature/home/widgets/small_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFullScreen extends StatelessWidget {
  const CategoryFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                return state.storesState.when(
                  onLoading: () => const Loading(),
                  onSuccess: (data) {
                    return Column(
                      children: [
                        AppBar(
                          title: Text(
                              "${"Malls in ".tr(context)}${context.read<CategoryCubit>().category.name}"),
                        ),
                        if (data.isEmpty)
                          NoResultMessage(
                            messageLabel:
                                "${"No products in the category ".tr(context)}${context.read<CategoryCubit>().category.name}",
                            buttonLabel: "Go Back".tr(context),
                            onButtonClicked: () {
                              context.pop();
                            },
                          )
                        else
                          ItemGridView(
                            items: data,
                            cardBuilder: (item) => SmallStoreCard(store: item),
                          ),
                      ],
                    );
                  },
                  onError: (domainError) => ErrorMessage(
                    message: domainError.message,
                    onTryAgain: () {
                      context.read<CategoryCubit>().fetchAllStores();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
