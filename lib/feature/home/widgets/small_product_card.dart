import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/broken_image.dart';
import 'package:delishop/feature/product_full_screen/product_cubit.dart';
import 'package:delishop/feature/product_full_screen/product_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/product/product.dart';

class SmallProductCard extends StatelessWidget {
  final Product product;

  const SmallProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(product: product, productRepo: getIt(), storeRepo: getIt(), favoriteRepo: getIt(), userDataRepo: getIt(), gaRepo: getIt()),
          child: const ProductFullScreen(),
        ));
      },
      child: SizedBox(
        width: 150.w,
        height: 150.w,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: product.productPicture != null
                      ? Image.network(
                          width: double.infinity,
                          height: 150.w,
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
      ),
    );
  }
}
