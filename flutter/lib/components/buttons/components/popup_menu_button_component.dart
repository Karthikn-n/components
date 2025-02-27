import 'package:flutter/material.dart';

class PopupMenuButtonComponent extends StatelessWidget {
  const PopupMenuButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("Item 1"),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("Item 2"),
        ),
        PopupMenuItem(
          value: 3,
          child: Text("Item 3"),
        ),
      ],
      onSelected: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected item $value")),
        );
      },
    );
  }
}
