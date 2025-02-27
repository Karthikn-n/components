import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeMode? themeMode;
  final Function? toggleTheme;
  final Function? authenticate;
  const ThemeProvider({
    super.key, 
    this.authenticate,
    required super.child,
    required this.themeMode,
    required this.toggleTheme,
  });

  static ThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }
  
  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return oldWidget.themeMode != themeMode;
  }

}