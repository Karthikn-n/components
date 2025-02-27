import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoFilledButton extends StatelessWidget {
  const CupertinoFilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () {
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Filled Cupertino button pressed")),
        );
      },
      child: Text("Filled button"), 
    );
  }
}
