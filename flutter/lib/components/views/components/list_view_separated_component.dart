import 'package:flutter/material.dart';

class ListViewSeparatedComponent extends StatelessWidget {
  const ListViewSeparatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List view Separated"),
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Title $index"),
            subtitle: Text("Subtitle $index"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}