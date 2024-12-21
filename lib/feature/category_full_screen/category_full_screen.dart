import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/feature/category_full_screen/category_cubit.dart';
import 'package:delishop/feature/home/widgets/small_store_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delishop/core/widgets/loading.dart';

class CategoryFullScreen extends StatelessWidget {
  const CategoryFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return state.storesState.when(
                onLoading: () => const Loading(),
                onSuccess: (data) {
                  return Column(
                    children: [
                      AppBar(
                        title: Text(
                            "${context.read<CategoryCubit>().category.name} Stores"),
                      ),
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
    );
  }
}
