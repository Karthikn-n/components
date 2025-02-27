import 'package:components/components/navigation/components/bottom_to_top_navigation.dart';
import 'package:components/components/navigation/components/fade_navigation.dart';
import 'package:components/components/navigation/components/inner_screen.dart';
import 'package:components/components/navigation/components/left_to_right_navigation.dart';
import 'package:components/components/navigation/components/right_to_left_navigation.dart';
import 'package:components/components/navigation/components/top_to_bottom_navigation.dart';
import 'package:flutter/material.dart';

class NavigationHome extends StatelessWidget {
  const NavigationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Navigations & Navigation types"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, TopToBottomNavigation(InnerScreenNavigation()));
                },
                child: Text("Top-Bottom Navigation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, BottomToTopNavigation(InnerScreenNavigation()));
                },
                child: Text("Bottom-Top Navigation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, RightToLeftNavigation(InnerScreenNavigation()));
                },
                child: Text("Right-Left Navigation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, LeftToRightNavigation(InnerScreenNavigation()));
                },
                child: Text("Left-Right Navigation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, FadeNavigation(InnerScreenNavigation()));
                },
                child: Text("Fade Navigation"),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/pageview_navigation');
              //   },
              //   child: Text("PageView Navigation"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}