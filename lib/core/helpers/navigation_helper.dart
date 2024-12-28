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

  void removeAndPush(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
          (route) => false,  // Removes all routes, so the screen will be the only screen in the stack
    );
  }
}
