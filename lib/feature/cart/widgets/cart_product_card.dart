import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/di_get_it.dart';
import '../../product_full_screen/product_cubit.dart';
import '../../product_full_screen/product_full_screen.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final Function(int newQuan) onQuantityChanged;
  final Function(DismissDirection direction) onDismiss;

  const CartProductCard(
      {super.key,
      required this.product,
      required this.onDismiss,
      required this.quantity,
      required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: DelishopColors.primary.withOpacity(0.3),
          ),
          child: const Row(
            children: [
              Spacer(),
              Icon(Icons.delete),
            ],
          )),
      key: Key(product.id.toString()),
      onDismissed: onDismiss,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.push(BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
                product: product,
                productRepo: getIt(),
                storeRepo: getIt(),
                favoriteRepo: getIt(),
                userDataRepo: getIt(),
                gaRepo: getIt(),
                dbService: getIt()),
            child: const ProductFullScreen(),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: DelishopTextStyles.font16RegularGrey
                            .copyWith(color: Colors.black),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: DelishopColors.primary),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CountButton(
                    onClick: () {
                      onQuantityChanged(quantity + 1);
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CountButton(
                    enabled: quantity > 1,
                    onClick: () {
                      onQuantityChanged(quantity - 1);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountButton extends StatelessWidget {
  final Function() onClick;
  final Widget child;
  final bool enabled;

  const CountButton({super.key, required this.onClick, required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    const double size = 35;
    return enabled ? ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(size, size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        backgroundColor: DelishopColors.imageBackground,
        padding: EdgeInsets.zero,
      ),
      onPressed: onClick,
      child: child,
    ) : const SizedBox(height: size * 1.3,width: size * 1.3);
  }
}
