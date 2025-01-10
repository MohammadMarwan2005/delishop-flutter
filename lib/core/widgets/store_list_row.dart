import 'package:delishop/core/data/model/store/store.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/no_result_message.dart';
import 'package:delishop/core/widgets/title_and_see_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../feature/all_malls/all_stores_screen.dart';
import '../../feature/home/widgets/items_lazy_row.dart';
import '../../feature/home/widgets/small_store_card.dart';
import '../theme/delishop_text_styles.dart';

class StoreListRow extends StatelessWidget {
  final List<Store> stores;

  const StoreListRow({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        TitleAndSeeAll(
          title: "Malls".tr(context),
          onClick: () {
            context.push(AllStoresScreen(stores: stores));
          },
        ),
        ItemsLazyRow(
            items: stores, cardBuilder: (item, _) => SmallStoreCard(store: item))
      ],
    );
  }
}
