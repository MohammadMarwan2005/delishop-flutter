import 'package:delishop/core/data/model/category/category.dart';
import 'package:delishop/core/di/di_get_it.dart';
import 'package:delishop/core/helpers/image_string_helper.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/feature/category_full_screen/category_cubit.dart';
import 'package:delishop/feature/category_full_screen/category_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/broken_image.dart';

class SmallCategoryWidget extends StatelessWidget {
  final Category category;

  const SmallCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              context.push(BlocProvider<CategoryCubit>(
                create: (context) =>
                    CategoryCubit(storeRepo: getIt(), category: category),
                child: const CategoryFullScreen(),
              ));
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.22),
              radius: 35,
              child: ClipOval(
                child: Container(
                  child: category.categoryPicture.isNotNullOrEmpty()
                      ? SvgPicture.network(
                    category.categoryPicture!.validatePicture(),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    colorFilter: false
                        ? ColorFilter.mode(
                        Theme.of(context).colorScheme.onPrimary,
                        BlendMode.srcIn)
                        : ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn),

                    // I want to make the color (selected) ? onPrimary : Primary
                    // errorBuilder: (context, error, stackTrace) {
                    //   return const BrokenImage();
                    // },
                  ) : const BrokenImage(),
                ),
              ),
            ),
          ),
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
