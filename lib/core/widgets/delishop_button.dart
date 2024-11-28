import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DelishopButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;

  const DelishopButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: isLoading
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isLoading) ...[SizedBox(width: 20.w)],
              Text(
                text,
                style: DelishopTextStyles.font16SemiBoldWhite,
              ),
              if (isLoading) ...[
                SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ))
              ],
            ],
          ),
        ));
  }
}
