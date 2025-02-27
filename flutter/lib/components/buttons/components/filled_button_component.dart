import 'package:flutter/material.dart';

class FilledButtonComponent extends StatelessWidget {
  const FilledButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Filled button pressed")),
        );
      }, 
      child: Text("Filled button")
    );
  }
}
