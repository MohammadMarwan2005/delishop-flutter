import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/lets_search_widget.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/core/widgets/no_result_message.dart';
import 'package:delishop/core/widgets/product_list_row.dart';
import 'package:delishop/core/widgets/store_list_row.dart';
import 'package:delishop/feature/search/cubit/search_cubit.dart';
import 'package:delishop/feature/search/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_filter_row.dart';

/*
* Todo:
* 1. Search Text Field, that apply search() after 1 second of alerting...
* 2. Filter Chips, (categories-stores-products)
* 3. Body:
*   if(selectedFilterChips.isEmpty) -> select filter chips please
*   else
*     selectedFilterChips.forEach({chip ->  chip.getResult()})
*  for example: selectedFilterChips = [Categories]
*   -> Categories
*   -> C1 - C2 - C3 (Like what saw in Home)
*
* State:
*   - Categories Search State
*   - Stores Search State
*   - Products Search State
*   - SearchTextField Search State
*   - SearchTextField Search State
*
*
* */

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchCubit>().search();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Search for products and malls".tr(context),
                elevation: const WidgetStatePropertyAll(2),
                controller: context.read<SearchCubit>().searchController,
                onSubmitted: (value) {
                  context.read<SearchCubit>().search();
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        context.read<SearchCubit>().search();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          state.categories.when(
                            onLoading: () {
                              return const Loading();
                            },
                            onSuccess: (data) {
                              return CategoriesFilterRow(
                                categories: data,
                                onSelectIndex: (index) {
                                  context
                                      .read<SearchCubit>()
                                      .onCategorySelected(index);
                                },
                                selectedIndex: context
                                    .read<SearchCubit>()
                                    .state
                                    .selectedCategoryIndex,
                              );
                            },
                            onError: (domainError) {
                              return ErrorMessage(
                                message: domainError.getMessage(context),
                                onTryAgain: () {},
                              );
                            },
                          ),
                          state.searchResult.when(
                            onInitial: () {
                              return LetsSearchWidget(
                                messageLabel:
                                    "Search for something to get the result"
                                        .tr(context),
                                buttonLabel: "Search",
                                onButtonClicked: () {
                                  context.read<SearchCubit>().search();
                                },
                              );
                            },
                            onLoading: () {
                              return const Loading();
                            },
                            onSuccess: (data) {
                              if (data.stores.isEmpty &&
                                  data.products.isEmpty) {
                                return NoResultMessage(
                                  messageLabel: context
                                      .read<SearchCubit>()
                                      .getProductsOrStoresFoundForThisKeywordInThisCategory(
                                          context),
                                  buttonLabel: "Try Again".tr(context),
                                  onButtonClicked: () {
                                    context.read<SearchCubit>().search();
                                  },
                                );
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StoreListRow(stores: data.stores),
                                  ProductListRow(products: data.products)
                                ],
                              );
                            },
                            onError: (domainError) {
                              return ErrorMessage(
                                message: domainError.getMessage(context),
                                onTryAgain: () {
                                  context.read<SearchCubit>().search();
                                },
                              );
                            },
                          )
                        ],
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
