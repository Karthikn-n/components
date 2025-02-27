import 'package:components/components/bio-metric/widgets/autheticated_screen.dart';
import 'package:components/components/bio-metric/widgets/pop_up.dart';
import 'package:components/services/authenticate_service.dart';
import 'package:flutter/material.dart';

class AuthenticationHome extends StatelessWidget {
  const AuthenticationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authentications"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if(await AuthenticateService.initializeLocalAuth()){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AutheticatedScreen(isBioMetric: true),));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Sorry can't authentciate try again")
                  ));
                }
              } ,
              child: Text("Bio-Metric")
            ),
            ElevatedButton(
              onPressed: () => qrPopup(context),
              child: Text("View QR Code")
            )
          ],
        ),
      ),
    );
  }
}
