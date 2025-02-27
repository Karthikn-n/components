import 'package:flutter/material.dart';

class TabsComponent extends StatelessWidget {
  const TabsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabs Components"),
          bottom:  TabBar(
            tabs: [
              Tab(text: "Tab 1",),
              Tab(text: "Tab 3",),
              Tab(text: "Tab 2",),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Tab body 1"),),
            Center(child: Text("Tab body 2"),),
            Center(child: Text("Tab body 3"),),
          ],
        )
      ),
    );
  }
}