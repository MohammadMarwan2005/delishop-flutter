import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
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
                            title: "Categories",
                            onClick: () {},
                          ),
                          ItemsLazyRow<Category>(
                            items: dataList,
                            cardBuilder: (item) =>
                                SmallCategoryWidget(category: item),
                          )
                        ],
                      );
                    },
                    onError: (domainError) {
                      return Text(domainError.toString());
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.storeState.when(
                    onLoading: () => const LoadingCircle(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Malls",
                            onClick: () {},
                          ),
                          ItemsLazyRow(
                              items: dataList,
                              cardBuilder: (item) =>
                                  SmallStoreCard(store: item))
                        ],
                      );
                    },
                    onError: (domainError) {
                      return Text(domainError.toString());
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.productState.when(
                    onLoading: () => const LoadingCircle(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Products",
                            onClick: () {},
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
                      return Text(domainError.toString());
                    },
                  ),
                  DelishopTextButton(onClick: () {
                    context.push(BlocProvider<AccountCubit>(create: (context) => getIt(), child: const AccountScreen()));
                  }, label: "Go to your Account")
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
