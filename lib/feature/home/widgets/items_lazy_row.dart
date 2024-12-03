import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsLazyRow<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) cardBuilder;


  const ItemsLazyRow({super.key, required this.items, required this.cardBuilder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) => cardBuilder(items[index])),
    );
  }
}
