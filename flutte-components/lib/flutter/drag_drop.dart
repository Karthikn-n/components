import 'dart:math';

import 'package:flutter/material.dart';

class DragAndDropExample extends StatefulWidget {
  const DragAndDropExample({super.key});

  @override
  State<DragAndDropExample> createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  Color targetColor = Colors.grey; // Default target color
  Color boxColor = Colors.blue;
  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drag & Drop Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable<Color>(
              // data: Colors.blue,
              // while dragging the widget is shows mostly used by the copy of the child
              feedback: Container(
                width: 100,
                height: 100,
                color: boxColor,
                alignment: Alignment.center,
                child: Text("Dragging", style: TextStyle(color: Colors.white, decoration: TextDecoration.none, fontSize: 14)),
              ),
              // Once the previours child is on dragging stage this will shows in the child place
              childWhenDragging: Container(
                width: 100,
                height: 100,
                color: Colors.grey.withValues(alpha: 0.1),
                alignment: Alignment.center,
                child: Text("Dropped", style: TextStyle(color: Colors.white)),
              ),
              // This will shows before the draging start
              child: Container(
                width: 100,
                height: 100,
                color: boxColor,
                alignment: Alignment.center,
                child: Text("Drag Me", style: TextStyle(color: Colors.white)),
              ),
              onDragCompleted: () {
                setState(() {
                  targetColor = boxColor;
                  boxColor = getRandomColor();
                });
              },
            ),
        
            SizedBox(height: 50),
            DragTarget<Color>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 120,
                  height: 120,
                  color: targetColor,
                  alignment: Alignment.center,
                  child: Text("Drop Here", style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: DragAndDropExample()));
}
