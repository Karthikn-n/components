import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Home Screen"),
        ),
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () {
                  
                },
                child: Text("Android views"), 
              ),
              CupertinoButton(
                onPressed: () {
                  
                },
                child: Text("Ios views"), 
              ),
            ],
          ),
        )
      )
    : Scaffold(
      appBar: AppBar(
        title: Text("Android"),
      ),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text("Android views"), 
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text("Ios views"), 
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}