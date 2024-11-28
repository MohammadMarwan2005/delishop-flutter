import 'package:flutter/cupertino.dart';

import 'delishop_text_button.dart';

class SuggestionAndTextButton extends StatelessWidget {
  final String suggestionText;
  final String buttonLabel;
  final Function() onClick;
  const SuggestionAndTextButton({super.key, required this.suggestionText, required this.buttonLabel, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(suggestionText),
        DelishopTextButton(
            onClick: onClick,
            label: buttonLabel)
      ],
    );
  }
}