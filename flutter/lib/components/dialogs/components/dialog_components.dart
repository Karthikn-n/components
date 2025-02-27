import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogComponents {
  BuildContext context;

  DialogComponents(this.context);

  void showCupertinoDatePicker() async {
    await showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            CupertinoButton(
              child: Text("Done"),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                minimumDate: DateTime(2000, 1, 1),
                maximumDate: DateTime(2100, 12, 31),
                onDateTimeChanged: (DateTime newDate) {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> showMaterialDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100),
    );
    return date;
  }

  void showMaterialBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) {
        return Center(
          child: Column(
            children: [
              Text("Bottom Sheet"),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }

  void cupertinoActionSheet(){
    showCupertinoModalPopup(
      context: context, 
      builder: (context) {
        return CupertinoActionSheet(
          title: Text("Choose an Option"),
          message: Text("Select one of the following:"),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Option 1"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Option 2"),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: Text("Cancel"),
          ),
        );
      },
    );
  }

  void cupertinoAlertDialog(){
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Cupertino Alert dialog"),
          actions: [
            CupertinoDialogAction(onPressed: () => Navigator.pop(context), isDestructiveAction: true,child: Text("back"),),
            CupertinoDialogAction(onPressed: () => Navigator.pop(context), isDefaultAction: true,child: Text("Ok"),),
          ],
        );
      },
    );
  }

  void showSimpleMaterialDialog() {
    showDialog(
      context: context, 
      builder: (context) {
        return SimpleDialog(
          title: Text("Simple Dialog"),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("Option 1"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("Option 2"),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text("Option 3"),
            ),
          ],
        );
      },
    );
  }

  void showMateralGeneralDialog(){
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: Duration(milliseconds: 400), // Duration of animation
      transitionBuilder: (context, anim, secondaryAnim, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(CurvedAnimation(parent: anim, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Animated Dialog", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("This dialog slides from top to center."),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Close"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }

  void showMateriaAboutDialog(){
    showAboutDialog(
      context: context,
      applicationIcon: FlutterLogo(),
      applicationName: "About Dialog",
      applicationVersion: "1.0.0",
      applicationLegalese: "This is an about dialog",
    );
  }

  void showMaterialDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("This is an alert dialog"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

}