import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:flutter/material.dart';

class OrderSummeryProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const OrderSummeryProductCard(
      {super.key, required this.product, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      "\$${(double.parse(product.price) * quantity).toStringAsFixed(2)}",
                      style: DelishopTextStyles.priceStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
