import 'package:components/common/common_data.dart';
import 'package:components/common/title.dart';
import 'package:flutter/material.dart';

class TextsComponents extends StatelessWidget {
  const TextsComponents({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Text types"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              TitleText("Selectable Text"),
              SelectableText(
                selectableText,
              ),
              TitleText("Rich Text"),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'This is ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' and this is ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'italic',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                    TextSpan(
                      text: ', These all comes in the same widget and its children RichText',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}