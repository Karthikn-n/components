import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/common/title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final UserCredential? userCredential;
  final String provider;
  const UserInfoWidget({super.key, this.userCredential, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: userCredential != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                child: CachedNetworkImage(imageUrl: userCredential!.user!.photoURL!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText("Name: "),
                  Text(userCredential!.user!.displayName!)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText("Email: "),
                  Text(userCredential!.user!.email!)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText("Name: "),
                  Text(userCredential!.user!.phoneNumber ?? "")
                ],
              ),
            ],
          )
        : Text("No user Found from this $provider"),
      ),
    );
  }
}