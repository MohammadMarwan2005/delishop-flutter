import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoResultMessage extends StatelessWidget {
  final String messageLabel;
  final String buttonLabel;
  final Function() onButtonClicked;

  const NoResultMessage({super.key, required this.messageLabel, required this.buttonLabel, required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              height: 200.h,
              width: 200.h,
              "assets/animation/an_no_result.json",
              repeat: true,
            ),
            Text(messageLabel, style: DelishopTextStyles.font18SemiBoldBlack),
            Flexible(child: SizedBox(height: 8.h,)),
            DelishopTextButton(onClick: onButtonClicked, label: buttonLabel),
            Flexible(child: SizedBox(height: 300.h,)),
          ],
        ),
      ),
    );
  }
}
