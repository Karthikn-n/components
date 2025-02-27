import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidersComponent extends StatefulWidget {
  const SlidersComponent({super.key});

  @override
  State<SlidersComponent> createState() => _SlidersComponentState();
}

class _SlidersComponentState extends State<SlidersComponent> {
  double _cupertinoSliderValue = 0.0; 
  double _materialSliderValue = 1.0; 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Text("Cupertino Slider", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
            CupertinoSlider(value: _cupertinoSliderValue, onChanged: (value) => setState(() {
              _cupertinoSliderValue = value;
            }),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            Text("Material Slider", style: TextStyle(fontSize: 18, decoration: TextDecoration.none),),
            Slider(
              divisions: 10,
              max: 10,
              min: 1,
              value: _materialSliderValue,
              label: _materialSliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _materialSliderValue = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}