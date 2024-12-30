import 'package:delishop/core/lang/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'get_page_models.dart';

class OnboardingScreen extends StatelessWidget {
  final Function() onDone;
  const OnboardingScreen({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: getPageModels(context),
      showNextButton: false,
      done: Text("Done!".tr(context)),
      isProgressTap: true,
      onDone: onDone,
    );
  }
}
