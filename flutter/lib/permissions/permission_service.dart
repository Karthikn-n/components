import 'package:permission_handler/permission_handler.dart';

/// Need permission for the App from the devices needs to Permissed by the User in the 
/// usage of the app If the permission is not granted the feature did not work for the user.
/// For android we can add the Permission in manifest file example like location
/// `<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>`
/// see all the permission here `https://developer.android.com/reference/android/Manifest.permission`
/// For ios We need to add Permission and the use case of the Permission why this app need this permission.
/// <!-- Camera -->
/// `<key>NSCameraUsageDescription</key>`
/// `<string>We need camera access to take photos</string>`.
/// To get all the permission list visit 
/// for easy understand : `https://www.iosdev.recipes/info-plist/permissions/`
/// official: `https://www.iosdev.recipes/info-plist/permissions/`
/// This class is only used to get permission using permission_handler packages. some packages 
/// have build-in permission request feature like location, flutter_local_notification.
/// With the status of the Permission then we can perform some operation for that 
/// visit this site `https://pub.dev/packages/permission_handler`
class PermissionService {
  static final PermissionService _service = PermissionService._internal();

  factory PermissionService() => _service;

  /** 
   Get the contact permission
    For android -> `<uses-permission android:name="android.permission.READ_CONTACTS"/>`
    For ios -> ` <key>NSContactsUsageDescription</key>`
      `<string>We need contacts access to sync your contacts</string>`
  *////

  static void contactPermission() async => Permission.contacts.request();

  /** 
   Get the Location permission
    For android -> `<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>`
    `<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>`
    For ios -> ` <key>NSLocationWhenInUseUsageDescription</key>`
      `<string>We need your location for better service</string>`
    
    This will only allow the forground location access Permission to access the location in background we need ask another permission
  *////
  static void locationPermission() async => Permission.location.request();

  /// This will allow the app to access the location in background for tracking like this 
  /// for that we need access any one of above permission request for android and 
  /// `<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>`
  /// for Ios we need this and string for explanation
  /// `<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>`
  static void locationAlwaysPermission() async => Permission.locationAlways.request();

  /** // 
   Get the microphone permission
    For android -> `<uses-permission android:name="android.permission.RECORD_AUDIO"/>`
    For ios -> ` <key>NSMicrophoneUsageDescription</key>`
      `<string>We need microphone access for voice recording</string>`
  *////
  static void microPhonePermission() async => Permission.microphone.request();

  /** // 
   Get the Storage read, write and manage permission
    For android to read the files from external storage -> `<uses-permission android:name="android.permission.READ_EXTERNAL_STORAG"/>`
    For android to write the files to external storage -> `<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAG"/>`
    For ios reading the images from gallary -> ` <key>NSPhotoLibraryUsageDescription</key>`
    `<string>*your app name* would like to access your photo gallery for uploading images to the app</string>`
    For ios writing the images to the gallary -> `<key>NSPhotoLibraryAddUsageDescription</key>`
    `<string>*your app name* would like to save photos from the app to your gallery</string>`
  *////// 
  static void storagePermission() async => Permission.storage.request();

  /** // 
   Get the Storage read, write and manage permission
    For android to scan the nearby bluetooth -> `<uses-permission android:name="android.permission.BLUETOOTH_SCAN"/>`
    For android to connect nearby bluetooth connection -> `<uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>`
    For ios detect the Blutooth connection -> ` <key>NSBluetoothPeripheralUsageDescription</key>`
    `<string>We need Bluetooth access to detect nearby devices</string>`
  *////// 
  static void bluetoothConnection() async => Permission.storage.request();

  /** // 
   Get the Camera permission to scan QR, record video or capture photo
    For android to get camera permission -> `<uses-permission android:name="android.permission.CAMERA"/>`
    For ios to get Camera permission -> ` <key>NSCameraUsageDescription</key>`
    `<string>We need Camera access to detect scan QR code</string>`
  *////// 
  static void cameraPermission() async => Permission.camera.request();

  /** 
   Get the sma permission to read OTP
    For android to get Message reading permission sms app -> `<uses-permission android:name="android.permission.READ_SMS"/>`
    For ios to get Message reading permission sms app -> ` <key>NSMessageUsageDescription</key>`
    `<string>We need access to your messages to provide this feature.</string>`
  *////
  static void smsPermission() async => Permission.sms.request();

  PermissionService._internal();
}