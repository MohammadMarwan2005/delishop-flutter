import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:delishop/core/widgets/delishop_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LetsSearchWidget extends StatelessWidget {
  final String messageLabel;
  final String buttonLabel;
  final Function() onButtonClicked;
  final double? height;

  const LetsSearchWidget(
      {super.key,
      required this.messageLabel,
      required this.buttonLabel,
      required this.onButtonClicked,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              height: height ?? 200.h,
              width: height ?? 1000.w,
              "assets/animation/lets_search_3.json",
              repeat: true,
            ),
            Text(
              messageLabel,
              style: DelishopTextStyles.font18SemiBoldBlack,
              textAlign: TextAlign.center,
            ),
            Flexible(
                child: SizedBox(
              height: 8.h,
            )),
            DelishopTextButton(onClick: onButtonClicked, label: buttonLabel),
          ],
        ),
      ),
    );
  }
}
