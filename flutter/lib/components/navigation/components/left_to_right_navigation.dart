import 'package:flutter/material.dart';

class LeftToRightNavigation extends PageRouteBuilder{
  final Widget screen;
  final Map<String, dynamic>? args;
  LeftToRightNavigation(this.screen, {this.args}) 
    : super(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        /// dx - Start from used to represent the x-axis (-1 - left, 1 - right)
        /// dy - Start from used to represent the y-axis (-1 - top, 1 - bottom)
        /// Offset(-1.0, 0.0) - Start from the left side of the screen
        /// Offset(0.0, 0.0) - End at the center of the screen
        const begin = Offset(-1.0, 0.0); 
        const end = Offset.zero; // Offset(1.0, 0.0) for full left to right
        const curve = Curves.easeInOutCirc;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 500),
      settings: RouteSettings(arguments: args)
    );

}