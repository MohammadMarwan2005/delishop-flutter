import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/theme/delishop_colors.dart';
import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/broken_image.dart';
import 'package:delishop/feature/cart/cubit/cart_cubit.dart';
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
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
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
        ),
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: ProductCartButton(product: product)),
      ],
    );
  }
}

class ProductCartButton extends StatefulWidget {
  final Product product;

  const ProductCartButton({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCartButtonState createState() => _ProductCartButtonState();
}

class _ProductCartButtonState extends State<ProductCartButton> {
  late Future<bool> _isInCartFuture;

  @override
  void initState() {
    super.initState();
    _loadCartState();
  }

  void _loadCartState() {
    _isInCartFuture = context.read<CartCubit>().isProductInCart(widget.product.id);
  }

  void _toggleCart() async {
    final isInCart = await _isInCartFuture;
    if (isInCart) {
      context.read<CartCubit>().removeFromCart(widget.product.id);
    } else {
      context.read<CartCubit>().addProductToCart(widget.product);
    }

    setState(() {
      _loadCartState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isInCartFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 38,
            height: 38,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: DelishopColors.primary,
            ));
        }

        if (snapshot.hasError) {
          return const Icon(Icons.error, color: Colors.red);
        }

        if (snapshot.hasData) {
          final isInCart = snapshot.data!;
          return InkWell(
            onTap: _toggleCart,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: DelishopColors.primary,
              ),

              child: Icon(
                  isInCart ?
                  Icons.remove :
                  Icons.add),
            ),
          );

        }

        return const Placeholder();
      },
    );
  }
}
