import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/feature/home/widgets/items_lazy_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/broken_image.dart';

class CategoriesFilterRow extends StatelessWidget {
  final List<Category> categories;
  final Function(int? index) onSelectIndex;
  final int? selectedIndex;

  const CategoriesFilterRow(
      {super.key,
      required this.categories,
      required this.onSelectIndex,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ItemsLazyRow(
      size: 110,
      items: categories,
      cardBuilder: (category, index) {
        return CategoryFilterCard(
          category: category,
          selected: index == selectedIndex,
          onClick: () {
            if (index == selectedIndex) {
              onSelectIndex(-1);
            } else {
              onSelectIndex(index);
            }
          },
        );
      },
    );
  }
}

class CategoryFilterCard extends StatelessWidget {
  final Category category;
  final bool selected;
  final Function() onClick;

  const CategoryFilterCard(
      {super.key,
      required this.category,
      required this.selected,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    final color = (selected)
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.primary.withOpacity(0.35);
    return Padding(
      padding: EdgeInsets.all(4.h),
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 35,
              child: ClipOval(
                child: category.categoryPicture.isNotNullOrEmpty()
                    ? Image.network(
                        category.categoryPicture!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const BrokenImage();
                        },
                      )
                    : const BrokenImage(),
              ),
            ),
            Text(
              category.name,
              style: (selected)
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : const TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
