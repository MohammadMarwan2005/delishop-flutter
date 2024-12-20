import 'package:flutter/material.dart';

class ItemGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) cardBuilder;

  const ItemGridView({
    super.key,
    required this.items,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
