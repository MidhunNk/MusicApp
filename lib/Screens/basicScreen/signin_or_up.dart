import 'package:flutter/material.dart';
import 'package:music_app/Screens/basicScreen/siginin_screen.dart';
import 'package:music_app/Screens/basicScreen/signup_screen.dart';

class SignInOrUp extends StatefulWidget {
  const SignInOrUp({super.key});

  @override
  State<SignInOrUp> createState() => _SignInOrUpState();
}

class _SignInOrUpState extends State<SignInOrUp> {
//sign in first always
  bool showSigninPage = true;

  //signin/up
  void togglePages() {
    setState(() {
      showSigninPage = !showSigninPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSigninPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return SignUp(
        onTap: togglePages,
      );
    }
  }
}
