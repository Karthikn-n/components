import 'dart:ui';
import 'package:flutter/material.dart';

class BackdropFilterExample extends StatelessWidget {
  const BackdropFilterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            "https://wallpapercave.com/wp/wp4805734.jpg",
            fit: BoxFit.cover,
          ),

          // Blurred Container (Frosted Glass Effect)
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Rounded edges
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.white.withValues(alpha: 0.2), // Semi-transparent white
                  alignment: Alignment.center,
                  child: Text(
                    "Frosted Glass Effect",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

