import 'package:components/flutter/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  /// This will generate the Routes for the android application and move to screens
  /// based on the names from [Navigator.pushNamed]
  static Route<dynamic> generateAndroidRoute(RouteSettings setting) {
    /// In the main function [MaterialApp] the routes are defined if the app starts 
    /// First the [initialRoute] is rendered on the screen. then we can navigate to the screen using names
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }

  static Route<dynamic> generateIosRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      default:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
    }
  }
}