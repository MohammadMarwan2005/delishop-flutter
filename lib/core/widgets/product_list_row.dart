import 'package:delishop/core/data/model/product/product.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/title_and_see_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/all_produts/all_products_screen.dart';
import '../../feature/home/widgets/items_lazy_row.dart';
import '../../feature/home/widgets/small_product_card.dart';
import '../theme/delishop_text_styles.dart';
import 'no_result_message.dart';

class ProductListRow extends StatelessWidget {
  final List<Product> products;
  const ProductListRow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        TitleAndSeeAll(
          title: "Products".tr(context),
          onClick: () {
            context
                .push(AllProductsScreen(products: products));
          },
        ),
        ItemsLazyRow<Product>(
          items: products,
          cardBuilder: (item, _) =>
              SmallProductCard(product: item),
        )
      ],
    );
  }
}
