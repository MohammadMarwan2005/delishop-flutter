import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/product/product.dart';
import '../../../core/di/di_get_it.dart';
import '../../../core/theme/delishop_text_styles.dart';
import '../../../core/widgets/broken_image.dart';
import '../add_update_product/add_update_product_screen.dart';
import '../add_update_product/cubit/add_update_product_cubit.dart';

class MyProductCard extends StatelessWidget {
  final Product product;

  const MyProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(BlocProvider<AddUpdateProductCubit>(
          create: (context) => AddUpdateProductCubit(getIt(), getIt(), product),
          child: const AddUpdateProductScreen(),
        ));
      },
      child: SizedBox(
        width: 200,
        height: 200,
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
