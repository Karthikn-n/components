import 'package:flutter/material.dart';

class OutlinedButtonComponent extends StatelessWidget {
  const OutlinedButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Outlined material button pressed")),
        );
      }, 
      child: Text("Outlined button")
    );
  }
}
