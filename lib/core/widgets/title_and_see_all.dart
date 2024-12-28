import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/delishop_text_styles.dart';
import 'delishop_text_button.dart';

class TitleAndSeeAll extends StatelessWidget {
  final String title;
  final Function() onClick;
  const TitleAndSeeAll({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: DelishopTextStyles.font24OrangeBold
                .copyWith(color: Colors.black)),
        DelishopTextButton(
            onClick: onClick, label: "See All".tr(context))
      ],
    );
  }
}
