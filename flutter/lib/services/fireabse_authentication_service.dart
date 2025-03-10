import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  static final FirebaseAuthService _firebaseAuthService = FirebaseAuthService._internal();

  static final FirebaseAuth instance = FirebaseAuth.instance;

  // Email password login using Firebase
  Future<String> emailPasswordLogin(String email, String password) async {
    try {
      await instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return "Successfully LoggedIn";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "User not found";
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return "Something went wrong";
    } 
  }

  factory FirebaseAuthService() => _firebaseAuthService;
  FirebaseAuthService._internal();
}