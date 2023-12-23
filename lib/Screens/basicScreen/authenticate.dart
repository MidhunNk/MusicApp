import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Screens/basicScreen/HomeScreen.dart';
import 'package:music_app/Screens/basicScreen/signin_or_up.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //user logged in or not
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //signed in
          if (snapshot.hasData) {
            return const HomeScreen();
          }

          //not signed in
          else {
            return const SignInOrUp();
          }
        },
      ),
    );
  }
}
