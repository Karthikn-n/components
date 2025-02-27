import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 18, decoration: TextDecoration.none));
  }
}