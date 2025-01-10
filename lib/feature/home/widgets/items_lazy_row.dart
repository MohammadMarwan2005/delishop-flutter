import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsLazyRow<T> extends StatelessWidget {
  final double? size;
  final List<T> items;
  final Widget Function(T item) cardBuilder;


  const ItemsLazyRow({super.key, required this.items, required this.cardBuilder, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?? 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) => cardBuilder(items[index])),
    );
  }
}
