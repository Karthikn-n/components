import 'package:components/common/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwtichComponent extends StatefulWidget {
  const SwtichComponent({super.key});

  @override
  State<SwtichComponent> createState() => _SwtichComponentState();
}

class _SwtichComponentState extends State<SwtichComponent> {
  bool _isCupertinoSwitched = false;
  bool _isMaterialSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
         Row(
           children: [
            TitleText("Material Switch"),
             Switch(
              value: _isMaterialSwitched,
              onChanged: (bool value) {
                setState(() {
                  _isMaterialSwitched = value;
                });
              },
              activeColor: Colors.green, // Color when switch is ON
              inactiveThumbColor: Colors.grey, // Thumb color when OFF
                     ),
           ],
         ),
         Row(
           children: [
            TitleText("Cupertino Switch"),
             CupertinoSwitch(
              value: _isCupertinoSwitched,
              onChanged: (bool value) {
                setState(() {
                  _isCupertinoSwitched = value;
                });
              },
              activeTrackColor: CupertinoColors.activeGreen, // ON color
              inactiveTrackColor: CupertinoColors.systemGrey, // OFF color
            ),
           ],
         ),
      ],
    );
  }
}