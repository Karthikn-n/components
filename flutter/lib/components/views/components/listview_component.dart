import 'package:flutter/material.dart';

class ListviewComponent extends StatelessWidget {
  const ListviewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List view"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Title $index"),
            subtitle: Text("Subtitle $index"),
          );
        },
      ),
    );
  }
}
