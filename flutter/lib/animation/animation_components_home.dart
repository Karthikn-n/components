import 'package:components/animation/components/shimmer_animation_component.dart';
import 'package:components/flutter/fade_tran.dart';
import 'package:components/flutter/scale_tran.dart';
import 'package:components/flutter/slide_tran.dart';
import 'package:flutter/material.dart';

class AnimationComponentsHome extends StatelessWidget {
  const AnimationComponentsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShimmerAnimationComponent(),)),
              child: Text("Shimmer")
            ),
             ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FadeTransitionExample(),)),
              child: Text("Fade Transition")
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScaleTransitionExample(),)),
              child: Text("Scale Transition")
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SlideTransitionExample(),)),
              child: Text("Slider Transition")
            ),
          ],
        ),
      ),
    );
  }
}