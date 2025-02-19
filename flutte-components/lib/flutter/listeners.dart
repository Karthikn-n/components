import 'package:flutter/material.dart';

class Listeners extends StatefulWidget {
  const Listeners({super.key});

  @override
  State<Listeners> createState() => _ListenersState();
}

class _ListenersState extends State<Listeners> {
  double height = 40;
  double width = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listeners"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Button height: $height, Width: $width"),
            Listener(
              onPointerDown: (event) {
                setState(() {
                  height = height - 10;
                  width = width - 10;
                });
              },
              onPointerUp: (event) {
                setState(() {
                  height = 40;
                  width = 120;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                child: Center(child: Text("Click")),
              ),
            )
          ],
        ),
      ),
    );
  }
}