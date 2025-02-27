import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextButtonComponent extends StatelessWidget {
  const CupertinoTextButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cupertino Text Button Pressed")),
        );
      },
      child: Text("Cupertino Text Button"),
    );
  }
}
