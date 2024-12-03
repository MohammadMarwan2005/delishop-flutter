import 'package:delishop/core/theme/delishop_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocdocImageAndText extends StatelessWidget {
  const DocdocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
            width: 375.w, "assets/svgs/onboarding_background_image.svg"),
        Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ],
                stops: const [0.2, 1],
              ),
            ),
            child: Image.asset("assets/images/onboarding_doctor_image.png")),
        Positioned(
            bottom: 1,
            child: Text(
              "Best Doctor\nAppointment App",
              style: DelishopTextStyles.font32OrangeBold.copyWith(height: 1.5),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
