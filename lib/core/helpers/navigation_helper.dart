import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  void push(Widget screen) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  void pushReplacement(Widget screen) {
    Navigator.pushReplacement(
        this,
        MaterialPageRoute(
            builder: (context) => screen,
        ));
  }

  void pop() {
    Navigator.pop(this);
  }
}
