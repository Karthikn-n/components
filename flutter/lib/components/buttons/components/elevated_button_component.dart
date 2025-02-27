import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  const ElevatedButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(200),
      ),
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Elevated Button Long Pressed")),
        );
      },
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Elevated Button Pressed")),
        );
      }, 
      child: Text("Elevated button")
    );
  }
}