import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  final double? height;
  final double? width;
  const Loading({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Lottie.asset(
            height: 100.h,
            width: 100.h,
            "assets/animation/an_loading.json",
            repeat: true,
          ),
        ),
      ),
    );
  }
}
