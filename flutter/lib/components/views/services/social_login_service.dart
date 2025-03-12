import 'dart:convert';

import 'package:components/services/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SocialLoginService {
  static final SocialLoginService _socialLoginService = SocialLoginService._internal();

  static final Dio _dio = DioService.dio;

  static final String githubClientID = "Ov23livMMYXAPEaRseDX";
  static final String githubClientSecert = "51dd1d6c33312af24f799b5945f8c999198776d0";

  /// Google Sign in provider
  Future<UserCredential?> signInWithGoogle() async {
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null) {
        return null;
      }
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "";
    }
  }

  Future<UserCredential?> signInWithGitHub() async {
  try {
    // final clientId = githubClientID;
    // final clientSecret = githubClientSecert;
    // final redirectUri = "https://alumni-app-65e09.firebaseapp.com/__/auth/handler";

    // Step 1: Open GitHub Authentication URL
    // final result = await FlutterWebAuth.authenticate(
    //   url: "https://github.com/login/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUri&scope=read:user,user:email",
    //   callbackUrlScheme: "components",
    // );

    // // Step 2: Extract Code from URL
    // final code = Uri.parse(result).queryParameters['code'];

    // // Step 3: Exchange Code for Access Token
    // final response = await _dio.post(
    //   "https://github.com/login/oauth/access_token",
    //   options: Options(
    //     headers: {"Accept": "application/json"}
    //   ),
    //   data: {
    //     "client_id": clientId,
    //     "client_secret": clientSecret,
    //     "code": code!,
    //   },
    // );

    // final accessToken = json.decode(response.data)["access_token"];

    // if (accessToken == null) {
    //   return null;
    // }

    // // Step 4: Sign in with Firebase using GitHub Access Token
    // final AuthCredential credential = GithubAuthProvider.credential(accessToken);

    // UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(redirectUri);

    // return UserCredential;
  } on FirebaseAuthException catch (e) {
    throw e.message ?? "";
  }
}
 
  /// Login using facebook but it need some setup
  /// https://developers.facebook.com/docs/development/register/ for creating developer account
  /// https://console.firebase.google.com/u/0/project/alumni-app-65e09/authentication/providers for adding provider
  /// TODO: Create developer account and add AppID and AppSecert in the firebase console
  Future<UserCredential?> signInWithFacebook() async {
    try {

      // Trigger the sign-in flow
    final LoginResult fbUser = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(fbUser.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "";
   }
  }

  factory SocialLoginService() => _socialLoginService;
  SocialLoginService._internal();
}