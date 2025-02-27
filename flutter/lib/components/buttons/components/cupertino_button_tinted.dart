import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoButtonTinted extends StatelessWidget {
  const CupertinoButtonTinted({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.tinted(
      onPressed: () {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Cupertino Tinted button pressed")),
        );
      },
      child: Text("Cupertino Tinted button"), 
    );
  }
}
