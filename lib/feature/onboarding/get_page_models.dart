import 'package:delishop/core/lang/app_localization.dart';
import 'package:delishop/core/widgets/toggle_lang_button.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

List<PageViewModel> getPageModels(BuildContext context) {
  double height = MediaQuery.of(context).size.height / 3;
  return [
    PageViewModel(
        title: "Welcome to Delishop".tr(context),
        bodyWidget:
            "Start your journey with Delishop and enjoy the ultimate shopping experience!"
                .tr(context)
                .getBodyWithToggleLangButton(context),
        image: Lottie.asset(
          "assets/animation/an_guy_walking.json",
          frameRate: FrameRate.max,
          repeat: true,
        )),
    PageViewModel(
      title: "Fast and Reliable Delivery".tr(context),
      bodyWidget:
          "Your orders are delivered directly to your doorstep, wherever you are."
              .tr(context)
              .getBodyWithToggleLangButton(context),
      image: Lottie.asset(
        "assets/animation/an_delivery_guy.json",
        repeat: true,
      ),
    ),
    PageViewModel(
      title: "Ready to Delishop?".tr(context),
      bodyWidget:
          "Start your journey with Delishop and enjoy the ultimate shopping experience!"
              .tr(context)
              .getBodyWithToggleLangButton(context),
      image: Lottie.asset(
        height: height,
        width: height,
        fit: BoxFit.fill,
        "assets/animation/ecommerce_app.json",
        repeat: true,
      ),
    ),
  ];
}

extension OnboardingScreenHelper on String {
  Widget getBodyWithToggleLangButton(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 4.5;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Explore a world of products at your fingertips. Search, shop, and enjoy endless possibilities!"
              .tr(context),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Flexible(
          child: SizedBox(height: height),
        ),
        const ToggleLangButton()
      ],
    );
  }
}
