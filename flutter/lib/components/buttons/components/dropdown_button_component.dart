import 'package:flutter/material.dart';

class DropdownButtonComponent extends StatefulWidget {
  const DropdownButtonComponent({super.key});

  @override
  State<DropdownButtonComponent> createState() => _DropdownButtonComponentState();
}
class _DropdownButtonComponentState extends State<DropdownButtonComponent> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text("Select an item"),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Item $newValue selected")),
        );
      },
      items: <String>['Item 1', 'Item 2', 'Item 3', 'Item 4']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
