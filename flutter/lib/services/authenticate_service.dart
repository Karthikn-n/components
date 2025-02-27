import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// This class used to authenticate the User via biometric, Social login
/// for bio-metric it uses local_auth packge
/// step 1: Note that local_auth requires the use of a FragmentActivity instead of an Activity. To update your application:
/// If we use the FlutterActivity in the MainActivity.kt file change that into FlutterFragmentActivity()
/// step 2: Add the permission into the manifest file `<uses-permission android:name="android.permission.BIO_METRIC"/>`
/// step 3: For IOS it uses face ID add this permission to the info.plist file `<key>NSFaceIDUsageDescription</key>` `<string> why the app is uses the face id <string>`
class AuthenticateService {
  
  static final AuthenticateService _authenticateService = AuthenticateService._internal();

  static final LocalAuthentication auth = LocalAuthentication();

  /// It will initialize by checking the device is can use the biometric like fingerprint and facelock
  /// and If the Device actucally support for the biometric security
  static Future<bool> initializeLocalAuth() async {
    /// This will only return true if the device has Hardware for biometric and anyone of the 
    /// biometric is enabled on the device.
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    /// This will do the same operation like [canAuthenticateWithBiometrics] but also it will fallback
    /// If [canAuthenticateWithBiometrics] fails into device locking system like (pattern, pin, password).
    final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    /// To get all the Biometric list from the device
    final List<BiometricType> types = canAuthenticate ? await auth.getAvailableBiometrics() : [];
    if(types.isEmpty) return false;

    /// IF any biometric is available in the device check them to authenticate the user
    if (types.isNotEmpty) {
      /// If any one of the Biometric is available use that to authenticate the User if fingerprint and face
      /// is not available check the strong one to authenticate like using pin or pattern
     if(Platform.isAndroid){
        late final bool authenticate;
        if (types.contains(BiometricType.fingerprint) || types.contains(BiometricType.face)) {
          try {
            /// Authenticate with the biometric
            /// stickyAuth -> if the user is cancelled the authentication on the go it will return false instead of error message
            authenticate = await auth.authenticate(
              localizedReason: "Authenticate to move next screen",
              options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true) 
            );
          } on PlatformException catch (e) {
            throw e.toString();
          }
        } else {
          try {
            /// Authenticate with the biometric or else with the PIN or Pattern
            /// stickyAuth -> if the user is cancelled the authentication on the go it will return false instead of error message
            authenticate = await auth.authenticate(
              localizedReason: "Authenticate to move next screen",
              options: const AuthenticationOptions(stickyAuth: true) 
            );
          } on PlatformException catch (e) {
            throw e.toString();
          }
        }
        return authenticate;
     }
     if(Platform.isIOS) {
      late final bool authenticate;
      if (types.contains(BiometricType.iris) || types.contains(BiometricType.face)) {
          try {
            /// Authenticate with the biometric
            /// stickyAuth -> if the user is cancelled the authentication on the go it will return false instead of error message
            authenticate = await auth.authenticate(
              localizedReason: "Authenticate to move next screen",
              options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true) 
            );
          } on PlatformException catch (e) {
            throw e.toString();
          }
        } else {
          try {
            /// Authenticate with the biometric or else with the PIN or Pattern
            /// stickyAuth -> if the user is cancelled the authentication on the go it will return false instead of error message
            authenticate = await auth.authenticate(
              localizedReason: "Authenticate to move next screen",
              options: const AuthenticationOptions(stickyAuth: true) 
            );
          } on PlatformException catch (e) {
            throw e.toString();
          }
        }
     }
    }
    return false;
    
  }

  factory AuthenticateService() => _authenticateService;

  AuthenticateService._internal();

}