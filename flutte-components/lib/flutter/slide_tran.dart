import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  State<SlideTransitionExample> createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    // x → Horizontal movement, y → Vertical movement
    // -1.0(x) → Move left (off-screen)
    // 0.0(x) → center
    // 1.0(x) → Move right
    // -1.0(y) → Move up
    // 0.0(y) → center
    // 1.0(y) → Move down
    _animation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, -1)).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slide Transition Example")),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Container(width: 100, height: 100, color: Colors.orange),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
