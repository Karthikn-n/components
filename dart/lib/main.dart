import 'dart:io';

import 'package:components/flutter/app/android.dart';
import 'package:components/flutter/app/ios.dart';
import 'package:flutter/material.dart';

/// Where the Programm get started
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return Platform.isIOS ? IosApp() : AndroidApp();
  }
}