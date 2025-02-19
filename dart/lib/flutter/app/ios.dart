import 'package:components/flutter/routes/routes.dart';
import 'package:flutter/cupertino.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Component app",
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateIosRoute,
    );
  }
}