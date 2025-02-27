import 'package:components/components/media/components/pick_files.dart';
import 'package:flutter/material.dart';

class MediaComponentsHome extends StatelessWidget {
  const MediaComponentsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Components'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PickFilesComponent(),));
              }, 
              child: Text("Pick Images")
            )
          ],
        ),
      ),
    );
  }
}