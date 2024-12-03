import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/delishop_colors.dart';

class BrokenImage extends StatelessWidget {
  const BrokenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        color: Colors.grey[300], // Placeholder background color
        child: Icon(
          Icons.broken_image,
          color: DelishopColors.primary,
          size: 30,
        ),
      ),
    );
  }
}
