import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/feature/product_full_screen/product_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di_get_it.dart';
import '../../product_full_screen/product_cubit.dart';

class OrderSummeryProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final bool clickable;

  const OrderSummeryProductCard(
      {super.key,
      required this.product,
      required this.quantity,
      this.clickable = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: (clickable)
          ? () {
              context.push(BlocProvider<ProductCubit>(
                  create: (context) => ProductCubit(
                      product: product,
                      productRepo: getIt(),
                      storeRepo: getIt(),
                      favoriteRepo: getIt(),
                      userDataRepo: getIt(),
                      gaRepo: getIt(),
                      dbService: getIt()),
                  child: const ProductFullScreen()));
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            // Product Image
            SizedBox(
              width: 120,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: DelishopColors.imageBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                      product.productPicture?.validatePicture() ?? ""),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: DelishopTextStyles.font16RegularGrey
                        .copyWith(color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price and Quantity
                      Text(
                        "\$${product.price} × $quantity",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: DelishopColors.primary),
                      ),
                      // Total Price
                      Text(
                        "\$${(product.price * quantity).toStringAsFixed(2)}",
                        style: DelishopTextStyles.priceStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
