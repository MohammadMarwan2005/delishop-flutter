import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/product_full_screen/product_cubit.dart';
import 'package:delishop/feature/store_full_screen/store_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/model/store/store.dart';
import '../../core/widgets/broken_image.dart';
import '../../core/widgets/delishop_button.dart';

class ProductFullScreen extends StatelessWidget {

  const ProductFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.productState.when(
                    onLoading: () => const Loading(),
                    onSuccess: (product) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              // Product Image
                              product.productPicture != null
                                  ? ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          bottom: Radius.circular(8.0)),
                                      child: Image.network(
                                        product.productPicture!
                                            .validatePicture(),
                                        width: double.infinity,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const BrokenImage(),
                                      ),
                                    )
                                  : const BrokenImage(),
                              // Favorite Button
                              Positioned(
                                top: 16,
                                right: 16,
                                child: IconButton(
                                  icon: Icon(
                                    (product.isFavorite ?? false)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: (product.isFavorite ?? false)
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                  onPressed: () {
                                    // Handle favorite toggle
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "\$${product.price}",
                                  style: DelishopTextStyles
                                      .font16SemiBoldGreen,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: DelishopColors.grey),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${product.rating ?? 5.0}",
                                      style: DelishopTextStyles
                                          .font16SemiBoldBlack
                                          .copyWith(
                                              fontWeight:
                                                  FontWeight.normal),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                // state.productState.when(onLoading: () {
                                //   return CircularProgressIndicator();
                                // }, onSuccess: (data) {
                                //   return
                                // }, onError: (domainError) {
                                //   return ErrorMessage(message: domainError.message, onTryAgain: () {
                                //     context.read<ProductCubit>().fetchProductAndStore();
                                //   },);
                                // },),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    onError: (domainError) => ErrorMessage(
                      message: domainError.message,
                      onTryAgain: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: state.storeState.when(
                      onLoading: () {
                        return const Loading();
                      },
                      onSuccess: (data) {
                        return StoreInfo(store: data);
                      },
                      onError: (domainError) {
                        return ErrorMessage(
                          message: domainError.message,
                          onTryAgain: () {
                            context
                                .read<ProductCubit>()
                                .fetchProductAndStore();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DelishopButton(onPressed: () {}, text: "Add to Cart"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class StoreInfo extends StatelessWidget {
  final Store store;

  const StoreInfo({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(StoreFullScreen(store: store));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(store.storePicture.validatePicture()),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: DelishopTextStyles.font16SemiBoldBlack,
                ),
                Text(
                  store.location,
                  style: TextStyle(fontSize: 14, color: DelishopColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// todo:
// 1. get the whole product with the rating and isFavorite
// 2. get the store by id
// 3. make it ready for add/removing it from favorites
