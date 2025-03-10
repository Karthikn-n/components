import 'package:components/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseServices {
  static final FirebaseServices _firebaseServices = FirebaseServices._internal();

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
  }

  factory FirebaseServices() => _firebaseServices;

  FirebaseServices._internal();
}