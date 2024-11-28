import 'package:flutter/material.dart';

import '../../../core/theme/delishop_text_styles.dart';

class ErrorDetails extends StatelessWidget {
  final List<String> details;
  const ErrorDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: details.map((detail) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 5,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                detail,
                style: DelishopTextStyles.font15MediumBlack, // Adjust text style as needed
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
