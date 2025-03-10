import 'package:components/components/views/components/carousel_view_component.dart';
import 'package:components/components/views/components/dismissible_view_component.dart';
import 'package:components/components/views/components/form_component.dart';
import 'package:components/components/views/components/grid_view_component.dart';
import 'package:components/components/views/components/infinite_scroll_component.dart';
import 'package:components/components/views/components/list_view_separated_component.dart';
import 'package:components/components/views/components/listview_component.dart';
import 'package:components/components/views/components/login_view_component.dart';
import 'package:components/components/views/components/page_view_component.dart';
import 'package:components/components/views/components/sliver_components.dart';
import 'package:components/components/views/components/tabs_component.dart';
import 'package:flutter/material.dart';

class ViewsHome extends StatelessWidget {
  const ViewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Views in Flutter"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListviewComponent(),)), 
                child: Text("Listview")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewSeparatedComponent(),)), 
                child: Text("Listview Separated")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfiniteScrollExample(),)), 
                child: Text("Loading state(Infinite scroll)")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewComponent(),)), 
                child: Text("Grid View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselViewComponent(),)), 
                child: Text("Carousel View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewComponent(),)), 
                child: Text("Page View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SliverComponents(),)), 
                child: Text("Sliver View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TabsComponent(),)), 
                child: Text("Tab View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DismissibleViewComponent(),)), 
                child: Text("Dismissible View")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginViewComponent(),)), 
                child: Text("Login view")
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormviewComponent(),)), 
                child: Text("Sample Form view")
              ),
            ],
          ),
        ),
      ),
    );
  }
}