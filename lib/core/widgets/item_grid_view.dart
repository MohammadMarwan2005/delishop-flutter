import 'package:delishop/core/widgets/condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemGridView<T> extends StatelessWidget {
  final String? title;
  final List<T> items;
  final Widget Function(T item) cardBuilder;

  const ItemGridView({
    super.key,
    required this.items,
    required this.cardBuilder,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          const Text("Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          SizedBox(height: 4.h),
        ],
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return cardBuilder(items[index]);
          },
        ),
      ],
    );
  }
}
