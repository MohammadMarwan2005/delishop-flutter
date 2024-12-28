import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/feature/all_malls/all_stores_screen.dart';
import 'package:delishop/feature/all_produts/all_products_screen.dart';
import 'package:delishop/feature/favorite/favorite_cubit.dart';
import 'package:delishop/feature/favorite/favorite_screen.dart';
import 'package:delishop/feature/home/home_cubit.dart';
import 'package:delishop/feature/home/widgets/items_lazy_row.dart';
import 'package:delishop/feature/home/widgets/small_category_widget.dart';
import 'package:delishop/feature/home/widgets/small_product_card.dart';
import 'package:delishop/feature/home/widgets/small_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/di_get_it.dart';
import '../../core/widgets/loading_circle.dart';
import '../../core/widgets/title_and_see_all.dart';
import '../account/account_screen.dart';
import '../account/cubit/account_cubit.dart';
import '../all_categories/all_categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("Delishop", style: DelishopTextStyles.font32OrangeBold),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.categoryState.when(
                    onLoading: () => const LoadingCircle(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Categories".tr(context),
                            onClick: () {
                              context.push(AllCategoriesScreen(categories: dataList));
                            },
                          ),
                          ItemsLazyRow<Category>(
                            size: 100.w,
                            items: dataList,
                            cardBuilder: (item) =>
                                SmallCategoryWidget(category: item),
                          )
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(message: domainError.getMessage(context), onTryAgain: () {
                        context.read<HomeCubit>().getAllCategories();
                      },);
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.storeState.when(
                    onLoading: () => const LoadingCircle(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Malls".tr(context),
                            onClick: () {
                              context.push(AllStoresScreen(stores: dataList));
                            },
                          ),
                          ItemsLazyRow(
                              items: dataList,
                              cardBuilder: (item) =>
                                  SmallStoreCard(store: item))
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(message: domainError.getMessage(context), onTryAgain: () {
                        context.read<HomeCubit>().getAllStores();
                      },);
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.productState.when(
                    onLoading: () => const LoadingCircle(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Products".tr(context),
                            onClick: () {
                              context.push(AllProductsScreen(products: dataList));
                            },
                          ),
                          ItemsLazyRow<Product>(
                            items: dataList,
                            cardBuilder: (item) =>
                                SmallProductCard(product: item),
                          )
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(message: domainError.getMessage(context), onTryAgain: () {
                        context.read<HomeCubit>().getAllProducts();
                      },);
                    },
                  ),
                  DelishopTextButton(onClick: () {
                    context.push(BlocProvider<AccountCubit>(create: (context) => getIt(), child: const AccountScreen()));
                  }, label: "Go to your Account".tr(context)),
                  DelishopTextButton(onClick: () {
                    context.push(BlocProvider<FavoriteCubit>(create: (context) => getIt(), child: const FavoriteScreen()));
                  }, label: "Go to your Favorites".tr(context)),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
