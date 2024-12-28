import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/delishop_text_button.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DelishopTextButton(
            onClick: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Don't forget the password again! 🥲".tr(context))));
            },
            label: "Forget Password?".tr(context))
      ],
    );
  }
}
