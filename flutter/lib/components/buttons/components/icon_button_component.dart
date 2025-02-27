import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  const IconButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Icon button",
      style: IconButton.styleFrom(),
      icon: Icon(Icons.add),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Icon Button Pressed")),
        );
      },
    );
  }
}
