import 'package:flutter/material.dart';

class InnerScreenNavigation extends StatelessWidget {
  const InnerScreenNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inner Screen Navigation"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Go back")),
      ),
    );
  }
}