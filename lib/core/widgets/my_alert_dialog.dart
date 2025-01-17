import 'package:delishop/core/data/model/domain_error_model.dart';
import 'package:delishop/core/helpers/navigation_helper.dart';
import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../feature/auth/widgets/error_details.dart';
import 'delishop_text_button.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final List<String> details;
  final bool isError;
  final Function()? onGotItClicked;

  const MyAlertDialog({super.key, required this.title, required this.details, required this.isError, this.onGotItClicked});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        isError ? Icons.error : MdiIcons.check,
        color: isError ? Colors.red : Colors.green,
        size: 32,
      ),
      title: Text(title),
      content: ErrorDetails(details: details, isError: isError),
      actions: [
        DelishopTextButton(
          onClick: () {
            context.pop();
            if(onGotItClicked != null) onGotItClicked!();
          },
          label: "Got it!".tr(context),
        ),
      ],
    );
  }
}
