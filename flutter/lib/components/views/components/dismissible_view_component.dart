import 'package:flutter/material.dart';

class DismissibleViewComponent extends StatefulWidget {
  const DismissibleViewComponent({super.key});

  @override
  State<DismissibleViewComponent> createState() => _DismissibleViewComponentState();
}

class _DismissibleViewComponentState extends State<DismissibleViewComponent> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}"); // Sample items
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible List"),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
           final item = items[index];
          return Dismissible(
            key: Key(item), // Unique key for each item
            direction: DismissDirection.endToStart, // Swipe left to dismiss
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index); // Remove item on swipe
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$item dismissed")),
              );
            },
            child: ListTile(
              title: Text(item),
              trailing: const Icon(Icons.code),
              // leading: const Icon(Icons.drag_handle), // Drag icon
            ),
          );
        }, 
        itemCount:  items.length, 
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if(newIndex > oldIndex) newIndex--;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}