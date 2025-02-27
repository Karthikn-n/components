import 'package:components/home_screen.dart';
import 'package:components/flutter/routes.dart';
import 'package:components/provider/theme_provider.dart';
import 'package:flutter/material.dart';

/// Used when the App is runs on the Android platform
class AndroidApp extends StatefulWidget {
  const AndroidApp({super.key});

  @override
  State<AndroidApp> createState() => _AndroidAppState();
}

class _AndroidAppState extends State<AndroidApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(){
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeMode: _themeMode,
      toggleTheme: _toggleTheme,
      child: MaterialApp(
        title: "Component app",
        /// this goes into the initial route of the application if it using named routes
        initialRoute: "/",
        /// Use [home] or [initialRoute] both will shows error for this project we can stick with naming routes
        home: HomeScreen(),
        supportedLocales: <Locale>[
          Locale('en', 'US'),
          Locale('es', 'ES')
        ],
        onGenerateRoute: RouteGenerator.generateAndroidRoute,
        themeMode: _themeMode,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData.light(useMaterial3: true),
      ),
    );
  }
}