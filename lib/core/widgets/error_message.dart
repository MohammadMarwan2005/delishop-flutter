import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final Function() onTryAgain;

  const ErrorMessage(
      {super.key, required this.message, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(message),
            ElevatedButton(
                onPressed: onTryAgain, child: const Text("Try Again"))
          ],
        ),
      ),
    );
  }
}
