import 'package:components/flutter/change_dependencies.dart';
import 'package:components/flutter/fade_tran.dart';
import 'package:components/flutter/scale_tran.dart';
import 'package:components/flutter/slide_tran.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Components"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/cupertinoWidgets"), 
              child: Text("Cupertino widgets")
            ),
            OutlinedButton(onPressed: () {}, child: Text("Outlined button")),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/svgPictures"), 
              child: Text("Svg pictures")
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/backdrop"), 
              child: Text("Filtered images")
            ),
            ElevatedButton(
              onPressed: () async {
                bool canPop = await Navigator.maybePop(context);
                if (!canPop) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No screens to pop!")),
                  );
                }
              }, 
              child: Text("Maybe Pop")
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/dragdrop"), 
              child: Text("Draggable")
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/listeners"), 
              child: Text("Listeners")
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/layout"), 
              child: Text("Layout Builder")
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/fitted"), 
              child: Text("Fitted box")
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
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSizeExample(),)),
              child: Text("didChangeDependencies()")
            ),
          ],
        ),
      ),
    );
  }
  
}
