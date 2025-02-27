import 'package:flutter/material.dart';

class AutheticatedScreen extends StatelessWidget {
  final bool isBioMetric;
  final Map<String, dynamic>? args;
  const AutheticatedScreen({super.key, required this.isBioMetric, this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isBioMetric ? Text("Yay! You're authenticated") : SizedBox(),
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Go back"))
          ],
        ),
      ),
    );
  }
}