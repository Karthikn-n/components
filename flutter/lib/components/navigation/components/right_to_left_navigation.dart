import 'package:flutter/material.dart';

class RightToLeftNavigation extends PageRouteBuilder{
  final Widget screen;
  final Map<String, dynamic>? args;
  RightToLeftNavigation(this.screen, {this.args}) 
  : super(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero; // Offset(-1, 0) for full right to left
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