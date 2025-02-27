import 'package:flutter/material.dart';

class FunctionsComponent {
  void showDatePickerDialog(BuildContext context){
    showDatePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100));
  }
}