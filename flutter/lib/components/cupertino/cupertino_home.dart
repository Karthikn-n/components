import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidgets extends StatefulWidget {
  const CupertinoWidgets({super.key});

  @override
  State<CupertinoWidgets> createState() => _CupertinoWidgetsState();
}

class _CupertinoWidgetsState extends State<CupertinoWidgets> {
   bool isChecked = false;
  int radioSelected = 1;
  int pickedValue = 1;
  ScrollController scrollController = ScrollController();
  double sliderValue = 0.0; 
  int selectedSegment = 0;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino widgets"),
          automaticallyImplyLeading: true,
        ),
        child:  SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: CupertinoScrollbar(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    Text(
                      "Cupertino buttons", 
                      style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10,
                        children: [
                          CupertinoButton(
                            onPressed: () {
                              
                            },
                            child: Text("Cupertino text button"), 
                          ),
                          CupertinoButton.filled(child: Text("Filled button"), onPressed: () {},),
                          CupertinoButton.tinted(child: Text("Tinted button"), onPressed: () {},)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        CupertinoCheckbox(
                          value: isChecked, 
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text("Cupertino Check box", style: TextStyle(fontSize: 14, decoration: TextDecoration.none),)
                      ],
                    ),
                    Text("Cupertino Loading indicator", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                    Column(
                      spacing: 10,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            CupertinoActivityIndicator(),
                            Text("Fully")
                          ],
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            CupertinoActivityIndicator.partiallyRevealed(progress: 0.5,),
                            Text("Partially")
                          ],
                        )
                      ],
                    ),
                    CupertinoButton(
                      onPressed: () {
                        alertIos();
                      },
                      child: Text("Cupertino alert"), 
                    ),
                    CupertinoButton(
                      onPressed: () {
                        cupertinoActionsheet();
                      },
                      child: Text("Cupertino Action sheet"), 
                    ),
                    Text("Cupertino radio button", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(4, (index) {
                        return Row(
                          children: [
                            CupertinoRadio(
                              value: index + 1, 
                              groupValue: radioSelected, 
                              onChanged: (value) {
                                setState(() {
                                  radioSelected = value!;
                                });
                              },
                            ),
                            Text("${index + 1}")
                          ],
                        );
                      },)
                    ),
                    
                    Text("Cupertino Tab", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                    CupertinoTabBar(
                        items: [
                          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
                          BottomNavigationBarItem(icon: Icon(CupertinoIcons.minus)),
                      ]
                    ), 
                    CupertinoContextMenu(
                      enableHapticFeedback: true,
                      actions: [
                        CupertinoContextMenuAction(
                          child: Text("Option 1"),
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                        ),
                        CupertinoContextMenuAction(
                          child: Text("Option 2"),
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                        ),
                        CupertinoContextMenuAction(
                          child: Text("Option 3"),
                          onPressed: () {
                            Navigator.pop(context); 
                          },
                        ),
                      ], 
                      child: Text("cupertino action button long press")
                    ),
                    CupertinoListTile(title: Text("List tile"), onTap: () => null,),
                    CupertinoListTile.notched(title: Text("List tile notched"),  onTap: () => null),
                    Text("Picker", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                    SizedBox(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 30,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            pickedValue = value;
                          });
                        }, 
                        children: List.generate(20, (index) => Text("index ${index + 1}"),)
                      )
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text("Slider", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                        CupertinoSlider(value: sliderValue, onChanged: (value) => setState(() {
                          sliderValue = value;
                        }),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Switch", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
                        CupertinoSwitch(value: isChecked, onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },),
                      ],
                    ),
                    CupertinoTextField(
                      placeholder: "cupertino text field",
                    ),
                    CupertinoSlidingSegmentedControl<int>(
                      groupValue: selectedSegment,
                      onValueChanged: (int? newValue) {
                        setState(() {
                          selectedSegment = newValue!;
                        });
                      },
                      children: {
                        0: Text("Home"),
                        1: Text("Profile"),
                        2: Text("Settings"),
                      },
                    ),
                    CupertinoListTile(
                      title: Text("Selected Date: $date".split(' ')[0], style: TextStyle(fontSize: 20)), 
                      trailing: IconButton(onPressed: () => _showDatePicker(context), icon: Icon(CupertinoIcons.calendar)),
                      onTap: () => _showDatePicker,
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
 void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
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
                initialDateTime: date,
                minimumDate: DateTime(2000, 1, 1),
                maximumDate: DateTime(2100, 12, 31),
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    date = newDate;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void cupertinoActionsheet(){
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
  
  void alertIos(){
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

}