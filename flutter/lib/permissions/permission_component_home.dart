// ignore_for_file: use_build_context_synchronously

import 'package:components/permissions/permission_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionComponentHome extends StatelessWidget {
  const PermissionComponentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permissions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => PermissionService.storagePermission().then(
                (value) => _showPermissionStatus(context, value, "Storage"),
              ), 
              child: Text("Storage Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.microPhonePermission().then(
                (value) => _showPermissionStatus(context, value, "Microphone"),
              ), 
              child: Text("Microphone Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.locationPermission().then(
                (value) => _showPermissionStatus(context, value, "Location"),
              ),
              child: Text("Location Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.locationAlwaysPermission().then(
                (value) => _showPermissionStatus(context, value, "Location"),
              ), 
              child: Text("Background Location Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.bluetoothConnection().then(
                (value) => _showPermissionStatus(context, value, "Bluetooth"),
              ), 
              child: Text("Bluetooth Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.contactPermission().then(
                (value) => _showPermissionStatus(context, value, "Contacts"),
              ), 
              child: Text("Contacts Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.cameraPermission().then(
                (value) => _showPermissionStatus(context, value, "Camera"),
              ), 
              child: Text("Camera Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.smsPermission().then(
                (value) => _showPermissionStatus(context, value, "Sms"),
              ), 
              child: Text("Sms Permission")
            ),
          ],
        ),
      ),
    );
  }
 void _showPermissionStatus(BuildContext context, PermissionStatus status, String name) {
    String message;
    if (status.isGranted) {
      message = "$name Permission granted!";
    } else if (status.isDenied) {
      message = "$name Permission denied!";
    } else if (status.isPermanentlyDenied) {
      message = "$name Permission permanently denied! Go to settings.";
      openAppSettings(); // Open settings for user to enable manually
    } else {
      message = "$name Permission status: $status";
    }

    // Show Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}