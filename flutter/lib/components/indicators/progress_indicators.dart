import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorsComponent extends StatelessWidget {
  const ProgressIndicatorsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Indicators"),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Material Loading indicator", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
            CircularProgressIndicator(),
            LinearProgressIndicator(),
            Text("Cupertino Loading indicator", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
            Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    CupertinoActivityIndicator(),
                    Text("Fully")
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    CupertinoActivityIndicator.partiallyRevealed(progress: 0.5,),
                    Text("Partially")
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}