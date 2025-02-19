import 'package:components/flutter/routes/routes.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Component app",
      // this goes into the initial route of the application if it 
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateAndroidRoute,
    );
  }
}