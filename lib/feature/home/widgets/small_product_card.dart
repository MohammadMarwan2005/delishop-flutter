import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/broken_image.dart';
import 'package:flutter/material.dart';

import '../../../core/data/model/product/product.dart';

class SmallProductCard extends StatelessWidget {
  final Product product;

  const SmallProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: product.productPicture != null
                    ? Image.network(
                        product.productPicture!.validatePicture(),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const BrokenImage(),
                      )
                    : const BrokenImage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DelishopTextStyles.font16SemiBoldBlack,
                  ),
                  Text("\$${product.price}",
                      style: DelishopTextStyles.font12MediumBlack),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
