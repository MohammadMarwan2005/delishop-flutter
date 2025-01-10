import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/loading.dart' as loading;
import 'package:delishop/core/widgets/product_list_row.dart';
import 'package:delishop/core/widgets/store_list_row.dart';
import 'package:delishop/feature/home/home_cubit.dart';
import 'package:delishop/feature/home/widgets/items_lazy_row.dart';
import 'package:delishop/feature/home/widgets/small_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/title_and_see_all.dart';
import '../all_categories/all_categories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().logViewHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.categoryState.when(
                    onLoading: () => const loading.Loading(),
                    onSuccess: (dataList) {
                      return Column(
                        children: [
                          TitleAndSeeAll(
                            title: "Categories".tr(context),
                            onClick: () {
                              context.push(
                                  AllCategoriesScreen(categories: dataList));
                            },
                          ),
                          ItemsLazyRow<Category>(
                            size: 140,
                            items: dataList,
                            cardBuilder: (item, _) =>
                                SmallCategoryWidget(category: item),
                          )
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message: domainError.getMessage(context),
                        onTryAgain: () {
                          context.read<HomeCubit>().loadEmptyStates();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.storeState.when(
                    onLoading: () => const loading.Loading(),
                    onSuccess: (dataList) {
                      return StoreListRow(stores: dataList);
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message: domainError.getMessage(context),
                        onTryAgain: () {
                          context.read<HomeCubit>().loadEmptyStates();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 8.h),
                  state.productState.when(
                    onLoading: () => const loading.Loading(),
                    onSuccess: (dataList) {
                      return ProductListRow(products: dataList);
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message: domainError.getMessage(context),
                        onTryAgain: () {
                          context.read<HomeCubit>().loadEmptyStates();
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
