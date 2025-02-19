import 'package:components/flutter/home_screen.dart';
import 'package:components/flutter/routes.dart';
import 'package:flutter/material.dart';

/// Used when the App is runs on the Android platform
class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      themeMode: ThemeMode.system,
    );
  }
}