import 'package:components/common/title.dart';
import 'package:components/components/input-methods/components/text_form_field_component.dart';
import 'package:components/components/views/services/social_login_service.dart';
import 'package:components/components/views/widgets/user_info_widget.dart';
import 'package:components/services/fireabse_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LoginViewComponent extends StatefulWidget {
  const LoginViewComponent({super.key});

  @override
  State<LoginViewComponent> createState() => _LoginViewComponentState();
}

class _LoginViewComponentState extends State<LoginViewComponent> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  List<String> social = [
    "assets/logo/apple.png",
    "assets/logo/facebook.png",
    "assets/logo/github.png",
    "assets/logo/google.png",
    "assets/logo/linkedin.png",
    "assets/logo/x.png",
  ];
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  final SocialLoginService _socialLoginService = SocialLoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Views"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText("Email & Password"),
                TextFormFieldComponent(
                  controller: emailController,
                  hintText: "Enter your email",
                  textInputAction: TextInputAction.next,
                ),
                TextFormFieldComponent(
                  controller: passwordController,
                  hintText: "Enter your password",
                  textInputAction: TextInputAction.done,
                  isObseure: true,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await _firebaseAuthService.emailPasswordLogin(emailController.text, passwordController.text).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                      },);
                    }, 
                    child: Text("Login")
                  )
                ),
                Divider(color: Colors.grey, thickness: 1,),
                TitleText("Mobile number & OTP"),
                TextFormFieldComponent(
                  keyboardType: TextInputType.phone,
                  controller: mobileController,
                  hintText: "Enter your mobile number",
                  textInputAction: TextInputAction.next,
                ),
                Center(
                  child: Pinput(
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    controller: otpController,
                  ),
                ),
                Center(child: ElevatedButton(onPressed: (){}, child: Text("Send OTP"))),
                TitleText("Email & Magic Link"),
                TextFormFieldComponent(
                  keyboardType: TextInputType.phone,
                  controller: mobileController,
                  hintText: "Enter your mobile number",
                  textInputAction: TextInputAction.next,
                ),
                Center(child: ElevatedButton(onPressed: (){}, child: Text("Send Verification Link"))),
                Divider(color: Colors.grey, thickness: 1,),
                TitleText("Social login"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[0]),
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[1]),
                      ),
                    ),
                    IconButton(
                      onPressed: () async => await _socialLoginService.signInWithGitHub().then((value) {
                        if(value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Authentication Cancelled"))
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoWidget(provider: "Github", userCredential: value,),));
                        }
                      },),  
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[2]),
                      ),
                    ),
                    IconButton(
                      onPressed: () async => await _socialLoginService.signInWithGoogle().then((value) {
                        if(value == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Authentication Cancelled"))
                          );
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoWidget(provider: "Google", userCredential: value,),));
                        }
                      },), 
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[3]),
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[4]),
                      ),
                    ),
                    IconButton(
                      onPressed: () {}, 
                      icon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(social[5],),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey, thickness: 1,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}