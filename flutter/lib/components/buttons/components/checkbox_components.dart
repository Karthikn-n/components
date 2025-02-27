import 'package:components/common/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxComponents extends StatefulWidget {
  const CheckboxComponents({super.key});

  @override
  State<CheckboxComponents> createState() => _CheckboxComponentsState();
}

class _CheckboxComponentsState extends State<CheckboxComponents> {
  bool _materialCheck = false;
  bool _cupertinoCheck = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: _materialCheck,
          onChanged: (value) {
            setState(() {
              _materialCheck = value!;
            });
          },
          title: TitleText("Material Checkbox"),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        ListTile(
          onTap: () {
            setState(() {
              _cupertinoCheck = !_cupertinoCheck;
            });
          },
          leading: CupertinoCheckbox(
            value: _cupertinoCheck, 
            onChanged: (value) {
              setState(() {
                _cupertinoCheck = value!;
              });
            },
          ),
          title: TitleText("Cupertino Checkbox"),
        )
      ],
    );
  }
}