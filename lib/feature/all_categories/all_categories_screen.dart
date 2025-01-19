import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/feature/home/widgets/small_category_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/item_grid_view.dart';

class AllCategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  const AllCategoriesScreen({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories".tr(context)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ItemGridView(
                items: categories,
                cardBuilder: (item) => SmallCategoryWidget(category: item),
              ),
            ),
          )),
    );

  }
}
