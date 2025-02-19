import 'package:flutter/material.dart';

class ScreenSizeExample extends StatefulWidget {
  const ScreenSizeExample({super.key});

  @override
  State<ScreenSizeExample> createState() => _ScreenSizeExampleState();
}

class _ScreenSizeExampleState extends State<ScreenSizeExample> {
  double screenWidth = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Get screen width from MediaQuery
    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen Size Change Example", textScaler: TextScaler.linear(0.8),)),
      body: Center(
        child: Text("Screen Width: $screenWidth", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

