import 'package:components/model/expansion_model.dart';
import 'package:flutter/material.dart';

class ExpansionComponent extends StatefulWidget {
  const ExpansionComponent({super.key});

  @override
  State<ExpansionComponent> createState() => _ExpansionComponentState();
}

class _ExpansionComponentState extends State<ExpansionComponent> {

  final List<Item> _items = [
    Item(header: "Panel 1", body: "This is the content of Panel 1"),
    Item(header: "Panel 2", body: "This is the content of Panel 2"),
    Item(header: "Panel 3", body: "This is the content of Panel 3"),
  ];
  
 @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Click here to Expand"),
      children: [
        ListTile(
          title: Text(_items[0].body),
        ),
      ],
    );
  }
}