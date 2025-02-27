import 'package:components/permissions/permission_service.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => PermissionService.storagePermission(), 
              child: Text("Storage Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.microPhonePermission(), 
              child: Text("Microphone Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.locationPermission(), 
              child: Text("Location Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.locationAlwaysPermission(), 
              child: Text("Background Location Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.bluetoothConnection(), 
              child: Text("Bluetooth Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.contactPermission(), 
              child: Text("Contacts Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.cameraPermission(), 
              child: Text("Camera Permission")
            ),
            ElevatedButton(
              onPressed: () => PermissionService.smsPermission(), 
              child: Text("Camera Permission")
            ),
          ],
        ),
      ),
    );
  }
}