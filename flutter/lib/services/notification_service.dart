import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';
class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  static late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static final StreamController<NotificationResponse> selectNotificationStream = StreamController<NotificationResponse>.broadcast();
  static Future<void> init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // Initialize the Android notification Plugin setting
    AndroidInitializationSettings androidSetting = AndroidInitializationSettings(
      "@mipmap/ic_launcher"
    );
    DarwinInitializationSettings iosSetting = DarwinInitializationSettings();

    final InitializationSettings notificationSetting = InitializationSettings(
      android: androidSetting, 
      iOS: iosSetting
    );
    await flutterLocalNotificationsPlugin.initialize(
      notificationSetting,
      onDidReceiveNotificationResponse: selectNotificationStream.add
    );
    print("Notification settings initialized");
    await _requestPermissions();
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();


      await androidImplementation?.requestNotificationsPermission();
      
    }
  }
  
  // void _configureSelectNotificationSubject() {
  //   selectNotificationStream.stream
  //       .listen((NotificationResponse? response) async {
  //     await Navigator.of(context).push(MaterialPageRoute<void>(
  //       builder: (BuildContext context) =>
  //           SecondPage(response?.payload, data: response?.data),
  //     ));
  //   });
  // }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'test_channel',  // ✅ Use a valid channel ID
      'Test Channel',
      channelDescription: 'Testing notification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker'
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      1, 'plain title', 'plain body', notificationDetails,
      payload: 'item x'
    );
  }

  Future<void> showNotificationWithActions() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          urlLaunchActionId,
          'Action 1',
          icon: DrawableResourceAndroidBitmap('food'),
          contextual: true,
        ),
        AndroidNotificationAction(
          'id_2',
          'Action 2',
          titleColor: Color.fromARGB(255, 255, 0, 0),
          icon: DrawableResourceAndroidBitmap('secondary_icon'),
        ),
        AndroidNotificationAction(
          navigationActionId,
          'Action 3',
          icon: DrawableResourceAndroidBitmap('secondary_icon'),
          showsUserInterface: true,
          // By default, Android plugin will dismiss the notification when the
          // user tapped on a action (this mimics the behavior on iOS).
          cancelNotification: false,
        ),
      ],
    );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      1, 'plain title', 'plain body', notificationDetails,
      payload: 'item x'
    );
  }


  Future<void> showNotificationWithTextAction() async {
    const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction(
            'text_id_1',
            'Enter Text',
            icon: DrawableResourceAndroidBitmap('food'),
            inputs: <AndroidNotificationActionInput>[
              AndroidNotificationActionInput(
                label: 'Enter a message',
              ),
            ],
          ),
        ],
      );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        1, 'plain title', 'plain body', notificationDetails,
        payload: 'item x'
    );
  }

  
  Future<void> showNotificationWithTextChoice() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'text_id_2',
          'Action 2',
          icon: DrawableResourceAndroidBitmap('food'),
          inputs: <AndroidNotificationActionInput>[
            AndroidNotificationActionInput(
              choices: <String>['ABC', 'DEF'],
              allowFreeFormInput: false,
            ),
          ],
          contextual: true,
        ),
      ],
    );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      1, 'plain title', 'plain body', notificationDetails,
      payload: 'item x'
    );
  }

  Future<void> showNotificationCustomSound() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      channelDescription: 'your other channel description',
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
    );
    final NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      1, 'plain title', 'plain body', notificationDetails,
      payload: 'item x'
    );
  }

  void dispose() {
    selectNotificationStream.close();
  }

  factory NotificationService() => _notificationService;

  NotificationService._internal();
}