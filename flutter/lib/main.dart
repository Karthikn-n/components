import 'package:components/flutter/android.dart';
import 'package:components/services/connectivity_service.dart';
import 'package:components/services/dio_service.dart';
import 'package:components/services/firebase_services.dart';
import 'package:components/services/notification_service.dart';
import 'package:flutter/material.dart';

/// Where the Programm get started
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService.init();
  await DioService.init();
  await FirebaseServices.init();
  await NotificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return AndroidApp();
  }
}