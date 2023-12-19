import 'package:flutter/material.dart';
import 'package:music_app/components/log_textfield.dart';
import 'package:music_app/components/log_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //controllers
  final usernameController = TextEditingController();
  final passwordcontroller = TextEditingController();

  //signin
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 15, 15, 15),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 49,
              ),
              //musicapp logo
              Row(children: [
                Image.asset(
    "assets/image/demo6.jpg",
    height: 50,
    width: 50,
  );
              ],)
              const SizedBox(
                height: 49,
              ),
              //Hola Amigo
              const Text(
                "Hola Amigo",
                style: TextStyle(
                  color: Color.fromARGB(255, 88, 227, 93),
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 23,
              ),

              //username
              LogTextField(
                controller: usernameController,
                hintText: 'Username/email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //password
              LogTextField(
                controller: passwordcontroller,
                hintText: 'Secret Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),
              //forgot
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style:
                          TextStyle(color: Color.fromARGB(255, 103, 103, 103)),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //signin
              LogButton(
                onTap: signUserIn,
              ),

              const SizedBox(
                height: 40,
              ),

              //or op
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 11, 185, 43),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style:
                            TextStyle(color: Color.fromARGB(255, 11, 185, 43)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Color.fromARGB(255, 11, 185, 43),
                      ),
                    )
                  ],
                ),
              ),
              //google
              Row(
                children: [
                  Image.asset(
                    'assets/image/google_old.jpg',
                    height: 70,
                    )
                ],
              )

              //signup
            ],
          ),
        ),
      ),
    );
  }
}

class Logow extends StatelessWidget {
  const Logow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Logow();
  }
}

@override
Widget build(BuildContext context) {
  return Image.asset(
    "assets/image/demo6.jpg",
    height: 50,
    width: 50,
  );
}
