import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/home/widgets/small_product_card.dart';
import 'package:delishop/feature/store_full_screen/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/delishop_colors.dart';
import '../../core/theme/delishop_text_styles.dart';
import '../../core/widgets/broken_image.dart';

class StoreFullScreen extends StatelessWidget {
  const StoreFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<StoreCubit, StoreState>(
            builder: (context, state) {
              return Column(
                children: [
                  state.storeState.when(
                    onLoading: () {
                      return const Loading();
                    },
                    onSuccess: (store) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          store.storePicture.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(8.0)),
                                  child: Image.network(
                                    store.storePicture.validatePicture(),
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const BrokenImage(),
                                  ),
                                )
                              : const BrokenImage(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Store Name
                                Text(
                                  store.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Store Location
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Colors.grey),
                                    const SizedBox(width: 8),
                                    Text(
                                      store.location,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: DelishopColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Store Rating
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${store.rating ?? 5.0}",
                                      style: DelishopTextStyles
                                          .font16SemiBoldBlack
                                          .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // Store Description
                                Text(
                                  store.description,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: DelishopColors.grey,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                // Button to View Store Products
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message: domainError.message,
                        onTryAgain: () {
                          context.read<StoreCubit>().loadEmptyStates();
                        },
                      );
                    },
                  ),
                  state.productsState.when(
                    onLoading: () => const Loading(),
                    onSuccess: (data) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ItemGridView<Product>(
                          title: "Products".tr(context),
                          items: data,
                          cardBuilder: (item) {
                            return SmallProductCard(product: item);
                          },
                        ),
                      );
                    },
                    onError: (domainError) {
                      return ErrorMessage(
                        message: domainError.message,
                        onTryAgain: () {
                          context.read<StoreCubit>().loadEmptyStates();
                        },
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
