import 'package:flutter/material.dart';

class FadeNavigation extends PageRouteBuilder{
  final Widget screen;
  final Map<String, dynamic>? args;
  FadeNavigation(this.screen, {this.args})
  : super(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCirc;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        /// Fade transition this will fade the screen in and out
        final fadeTween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 500),
    );
}