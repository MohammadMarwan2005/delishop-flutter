import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/home/widgets/small_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Favorites".tr(context)),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return state.favoriteProducts.when(
              onLoading: () {
                return const Loading();
              },
              onSuccess: (data) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<FavoriteCubit>().fetchFavoriteProducts();
                  },
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => ItemGridView(
                        items: data,
                        cardBuilder: (item) => SmallProductCard(product: item)),
                  ),
                );
              },
              onError: (domainError) {
                return ErrorMessage(
                  message: domainError.message,
                  onTryAgain: () {
                    context.read<FavoriteCubit>().fetchFavoriteProducts();
                  },
                );
              },
            );
          },
        ),
      )),
    );
  }
}
