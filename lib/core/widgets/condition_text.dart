
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionText extends StatelessWidget {
  final String name;
  final bool validated;

  const ConditionText({super.key, required this.name, required this.validated});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 4,
            backgroundColor:
            validated ? Colors.green : Theme.of(context).colorScheme.error),
        SizedBox(width: 5.h),
        Text(name)
      ],
    );
  }
}
