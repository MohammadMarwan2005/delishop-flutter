import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Lottie.asset(
          height: 100.h,
          width: 100.h,
          "assets/animation/an_loading.json",
          repeat: true,
        ),
      ),
    );
  }
}
