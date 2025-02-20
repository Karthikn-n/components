import 'package:flutter/material.dart';
/// The FittedBox widget scales its child to fit inside its parent without overflowing.
/// Prevents text overflow in small screens
class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FittedBox Example")),
      body: Center(
        child: Container(
          width: 200, // Fixed width
          height: 100, // Fixed height
          color: Colors.blueAccent,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text("Scaling Text!", style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
