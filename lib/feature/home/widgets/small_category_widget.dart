import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/broken_image.dart';
class SmallCategoryWidget extends StatelessWidget {
  final Category category;

  const SmallCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: category.categoryPicture.isNotNullOrEmpty() ? Image.network(
            category.categoryPicture!,
            width: 60, // Adjust size as needed
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const BrokenImage();
            },
          ) : const BrokenImage(),
        ),
        const SizedBox(height: 8), // Spacing between image and text
        Text(
          category.name,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}