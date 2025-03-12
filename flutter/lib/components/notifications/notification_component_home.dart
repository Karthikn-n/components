import 'package:components/services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationComponentHome extends StatefulWidget {
  const NotificationComponentHome({super.key});

  @override
  State<NotificationComponentHome> createState() => _NotificationComponentHomeState();
}

class _NotificationComponentHomeState extends State<NotificationComponentHome> {
  final NotificationService _notificationService = NotificationService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () async => await _notificationService.showNotification(), 
              child: Text("Show Notification")
            ),
            FilledButton(
              onPressed: () async => await _notificationService.showNotificationWithTextAction(), 
              child: Text("Show Notification with TextAction")
            ),
            FilledButton(
              onPressed: () async => await _notificationService.showNotificationWithTextChoice(), 
              child: Text("Show Notification with Text Choice")
            ),
            FilledButton(
              onPressed: () async => await _notificationService.showNotificationCustomSound(), 
              child: Text("Show Notification with Custom sound")
            ),
          ],
        ),
      ),
    );
  }
}