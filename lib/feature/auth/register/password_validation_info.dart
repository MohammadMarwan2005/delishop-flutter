import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/condition_text.dart';

class PasswordValidationInfo extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidationInfo({
    super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasNumber, required this.hasSpecialCharacter, required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConditionText(
            name: "Must have at least one lower case letter",
            validated: hasLowerCase),
        SizedBox(height: 2.h),
        ConditionText(
            name: "Must have at least one upper case letter",
            validated: hasUpperCase),
        SizedBox(height: 2.h),
        ConditionText(
            name: "Must have at least one number",
            validated: hasNumber),
        SizedBox(height: 2.h),
        ConditionText(
            name: "Must have at least one special Character",
            validated: hasSpecialCharacter),
        SizedBox(height: 2.h),
        ConditionText(
            name: "Must be at least 8 characters",
            validated: hasMinLength),
        SizedBox(height: 2.h),
      ],
    );
  }
}
