import 'dart:math';

import 'package:components/common/title.dart';
import 'package:flutter/material.dart';

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({super.key});

  @override
  State<GridViewComponent> createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
      ),
      body: RefreshIndicator(
        onRefresh: () async { 
          setState(() {
            
          });
         },
        child: GridView.builder(
          gridDelegate: _currentIndex == 1 
          ? SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)
          : SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 10
          ), 
          itemCount: 100,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              width: 50,
              child: Card(
                color:  Color.fromRGBO(
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                  1.0,
                ),
                child: Center(
                  child: TitleText("Index ${index + 1}"),
                ),
              ),
            );
          },
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: "Max Cross",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: "Fixed Cross"
          ),
        ]
      ),
    );
  }
}