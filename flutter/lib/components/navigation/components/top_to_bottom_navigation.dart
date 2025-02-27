import 'package:flutter/material.dart';

class TopToBottomNavigation extends PageRouteBuilder{
  final Widget screen;
  final Map<String, dynamic>? args;
  TopToBottomNavigation(this.screen, {this.args}) 
  : super(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, -1);
        const end = Offset.zero; // Offset(0, 1) for full top to bottom
        const curve = Curves.easeInOutCirc;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
      reverseTransitionDuration: Duration(milliseconds: 500),
      settings: RouteSettings(arguments: args),
    );
}