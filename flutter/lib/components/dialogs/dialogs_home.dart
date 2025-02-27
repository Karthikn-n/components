import 'package:components/common/title.dart';
import 'package:components/components/dialogs/components/dialog_components.dart';
import 'package:flutter/material.dart';

class DialogsHome extends StatelessWidget {
  const DialogsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialogs"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            children: [
              TitleText("Material Popup's",),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showMaterialDialog(), 
                child: Text("Alert Dialog")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showMateriaAboutDialog(), 
                child: Text("About Dialog")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showSimpleMaterialDialog(), 
                child: Text("Simple Dialog")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showMateralGeneralDialog(), 
                child: Text("General Dialog")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showMaterialDatePicker(), 
                child: Text("Date picker")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showMaterialBottomSheet(), 
                child: Text("Bottom sheet")
              ),
              TitleText("Cupertino Popup's",),
              ElevatedButton(
                onPressed: () => DialogComponents(context).cupertinoAlertDialog(), 
                child: Text("Cupertino Dialog")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).cupertinoActionSheet(), 
                child: Text("Cupertino Action sheet")
              ),
              ElevatedButton(
                onPressed: () => DialogComponents(context).showCupertinoDatePicker(), 
                child: Text("Cupertino Date picker")
              ),
            ],
          ),
        ),
      ),
    );
  }
}