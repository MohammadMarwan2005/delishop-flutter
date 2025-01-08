import 'package:delishop/core/helpers/alert_dialog_helper.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/ui_state.dart';
import 'package:delishop/core/widgets/error_message.dart';
import 'package:delishop/core/widgets/loading.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
import 'package:delishop/feature/product_full_screen/product_cubit.dart';
import 'package:delishop/feature/store_full_screen/store_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/data/model/store/store.dart';
import '../../core/di/di_get_it.dart';
import '../../core/widgets/broken_image.dart';
import '../../core/widgets/delishop_button.dart';
import '../../core/widgets/my_alert_dialog.dart';
import '../cart/cart_screen.dart';
import '../store_full_screen/store_cubit.dart';

class ProductFullScreen extends StatelessWidget {
  const ProductFullScreen({super.key});

  @override
  Widget build(BuildContext outerContext) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              state.favoriteState.when(
                onLoading: () {},
                onSuccess: (data) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return MyAlertDialog(
                          title: state.productState.data!.isFavorite
                              .getMessage(context),
                          details: [data.message],
                          isError: false);
                    },
                  );
                },
                onError: (domainError) {
                  context.setupErrorState(domainError);
                },
              );
            },
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
                                    if (product.isFavorite ?? false) {
                                      context
                                          .read<ProductCubit>()
                                          .removeFromFavorite();
                                      // context.read<ProductCubit>().fetchProductAndStore();
                                    } else {
                                      context
                                          .read<ProductCubit>()
                                          .addToFavorite();
                                      // context.read<ProductCubit>().fetchProductAndStore();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                                  style: DelishopTextStyles.font16SemiBoldGreen,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                      fontSize: 16, color: DelishopColors.grey),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${product.rating ?? 5.0}",
                                      style: DelishopTextStyles
                                          .font16SemiBoldBlack
                                          .copyWith(
                                              fontWeight: FontWeight.normal),
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
                      message: domainError.getMessage(context),
                      onTryAgain: () {
                        context.read<ProductCubit>().reloadEmptyStates();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: state.copyWith().storeState.when(
                      onLoading: () {
                        return const Loading();
                      },
                      onSuccess: (data) {
                        return StoreInfo(store: data);
                      },
                      onError: (domainError) {
                        return ErrorMessage(
                          message: domainError.getMessage(context),
                          onTryAgain: () {
                            context.read<ProductCubit>().reloadEmptyStates();
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: state.isInCartState.when(
                      onLoading: () => const Loading(),
                      onSuccess: (data) {
                        if (data) {
                          return DelishopButton(
                              onPressed: () {
                                final product =
                                    context.read<ProductCubit>().product;
                                setupConfirmationSnackBar(context, () {
                                  outerContext
                                      .read<CartCubit>()
                                      .addProductToCart(product,
                                          increaseBadge: false);
                                  context.read<ProductCubit>().fetchIsInCart();
                                }, product.name);
                                context
                                    .read<CartCubit>()
                                    .removeFromCart(product.id);
                                context.read<ProductCubit>().fetchIsInCart();
                              },
                              text: "Remove from Cart".tr(context));
                        } else {
                          return DelishopButton(
                              onPressed: () {
                                if (state.productState.data != null) {
                                  context.read<CartCubit>().addProductToCart(
                                      state.productState.data!);
                                  context.read<ProductCubit>().fetchIsInCart();
                                } else {
                                  context
                                      .read<ProductCubit>()
                                      .reloadEmptyStates();
                                }
                              },
                              text: "Add to Cart".tr(context));
                        }
                      },
                      onError: (domainError) {
                        return ErrorMessage(
                          message: domainError.getMessage(context),
                          onTryAgain: () {
                            context.read<ProductCubit>().reloadEmptyStates();
                          },
                        );
                      },
                    ),
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
      borderRadius: BorderRadius.circular(8.0),
      onTap: () {
        context.push(BlocProvider<StoreCubit>(
          create: (context) => StoreCubit(
              productRepo: getIt(),
              storeRepo: getIt(),
              storeId: store.id,
              userDataRepo: getIt(),
              gaRepo: getIt()),
          child: const StoreFullScreen(),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  store.locationName,
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

extension MessageHelper on bool? {
  String getMessage(BuildContext context) {
    if (this == null) return "";
    return this! ? "Added".tr(context) : "Removed".tr(context);
  }
}
