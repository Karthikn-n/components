import 'package:components/flutter/backdrop.dart';
import 'package:components/flutter/cupertino_widgets.dart';
import 'package:components/flutter/drag_drop.dart';
import 'package:components/flutter/filtted.dart';
import 'package:components/flutter/home_screen.dart';
import 'package:components/flutter/layout.dart';
import 'package:components/flutter/listeners.dart';
import 'package:components/flutter/svg_pictures.dart';
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
      case '/cupertinoWidgets':
        return CupertinoPageRoute(builder: (_) => CupertinoWidgets());
      case '/svgPictures':
        return MaterialPageRoute(builder: (_) => SvgPictures());
      case '/backdrop':
        return MaterialPageRoute(builder: (_) => BackdropFilterExample());
      case '/dragdrop':
        return MaterialPageRoute(builder: (_) => DragAndDropExample());
      case '/listeners':
        return MaterialPageRoute(builder: (_) => Listeners());
      case '/layout':
        return MaterialPageRoute(builder: (_) => LayoutBuilderExample());
      case '/fitted':
        return MaterialPageRoute(builder: (_) => FittedBoxExample());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}