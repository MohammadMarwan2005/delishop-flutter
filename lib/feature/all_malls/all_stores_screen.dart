import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/item_grid_view.dart';
import 'package:delishop/feature/home/widgets/small_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStoresScreen extends StatelessWidget {
  final List<Store> stores;

  const AllStoresScreen({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text("All Malls".tr(context)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ItemGridView(
            items: stores,
            cardBuilder: (item) => SmallStoreCard(store: item),
          ),
        ),
      )),
    );
  }
}
