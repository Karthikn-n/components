import 'package:flutter/material.dart';

class NoAnimationNavigation extends PageRouteBuilder{
  final Widget screen;
  final Map<String, dynamic>? args;
  NoAnimationNavigation(this.screen, {this.args})
  : super(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: Duration(milliseconds: 0),
      reverseTransitionDuration: Duration(milliseconds: 0),
    );
}