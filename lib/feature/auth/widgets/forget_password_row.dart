import 'package:flutter/material.dart';

import '../../../core/widgets/delishop_text_button.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DelishopTextButton(
            onClick: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Don't forget the password again! 🥲")));
            },
            label: "Forget Password?")
      ],
    );
  }
}
