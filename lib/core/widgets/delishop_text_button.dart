import 'package:flutter/material.dart';
import '../theme/delishop_colors.dart';

class DelishopTextButton extends StatelessWidget {
  final Function() onClick;
  final String label;

  const DelishopTextButton(
      {super.key, required this.onClick, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        label,
        style: TextStyle(color: DelishopColors.primary),
      ),
    );
  }
}
