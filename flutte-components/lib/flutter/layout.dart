import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LayoutBuilder Example")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // automaticllay adjust the spaces between children and make sure they have the same space
            return Flex(
              direction: Axis.vertical,
              children: [
                Flexible(flex: 4, child: Container(color: Colors.red, height: 100)),
                Flexible(flex: 3, child: Container(color: Colors.blue, height: 100)),
                Flexible(flex: 2, child: Container(color: Colors.green, height: 100)),
              ],
            );
          } else {
            return Flex(
              direction: Axis.vertical,
              children: [
                /// Each widget gets a fraction of the available space using flex if the available space is 
                /// 1300 pixels the the 8+4+1 = 13 -> 8/13, 4/13, 1/13 -> 800pixels, 400 px, 100px
                Expanded(flex: 8, child: Container(color: Colors.red, height: 100)),
                Expanded(flex: 4, child: Container(color: Colors.blue, height: 100)),
                Expanded(child: Container(color: Colors.green, height: 100)),
              ],
            );
          }
        },
      ),
    );
  }
}

