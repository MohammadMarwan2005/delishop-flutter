import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/home/widgets/small_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/item_grid_view.dart';

class AllProductsScreen extends StatelessWidget {
  final List<Product> products;
  const AllProductsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products".tr(context)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ItemGridView(
                items: products,
                cardBuilder: (item) => SmallProductCard(product: item),
              ),
            ),
          )),
    );
  }
}
