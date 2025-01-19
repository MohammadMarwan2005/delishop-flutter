import 'package:flutter/material.dart';

extension NavigationHelper on BuildContext {
  void push(Widget screen) {
    Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Start from the right
          const end = Offset.zero; // End at the current position
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  void pushReplacement(Widget screen) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void removeAndPush(Widget screen) {
    Navigator.pushAndRemoveUntil(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
          (route) => false,
    );
  }
}



//
// extension NavigationHelper on BuildContext {
//   void push(Widget screen) {
//     Navigator.push(
//         this,
//         MaterialPageRoute(
//           builder: (context) => screen,
//         ));
//   }
//
//   void pushReplacement(Widget screen) {
//     Navigator.pushReplacement(
//         this,
//         MaterialPageRoute(
//             builder: (context) => screen,
//         ));
//   }
//
//   void pop() {
//     Navigator.pop(this);
//   }
//
//   void removeAndPush(Widget screen) {
//     Navigator.pushAndRemoveUntil(
//       this,
//       MaterialPageRoute(builder: (context) => screen),
//           (route) => false,  // Removes all routes, so the screen will be the only screen in the stack
//     );
//   }
// }
