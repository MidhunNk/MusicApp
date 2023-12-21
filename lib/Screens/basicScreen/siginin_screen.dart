import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Services/google_auth.dart';
import 'package:music_app/components/log_textfield.dart';
import 'package:music_app/components/log_button.dart';
import 'package:music_app/components/square_box.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  LoginScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers
  final emailController = TextEditingController();

  final passwordcontroller = TextEditingController();

  //signin
  void signUserIn() async {
    //load
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //signin

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordcontroller.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      signinErrorMessage(e.code);
    }
  }

  void signinErrorMessage(String m) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 64, 186, 68),
          title: Center(
            child: Text(
              m,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 49,
                ),
                //musicapp logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/demo6.jpg",
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                //Hola Amigo
                const Text(
                  "Hola Amigo",
                  style: TextStyle(
                    color: Color.fromARGB(255, 88, 227, 93),
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),

                //username
                LogTextField(
                  controller: emailController,
                  hintText: 'Email',
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                //signin
                LogButton(
                  text: "Sign In",
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 11, 185, 43)),
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
                const SizedBox(
                  height: 30,
                ),
                //google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareBox(
                        onTap: () => GoogleAuth().signInWithGoogle(),
                        imagepath: 'assets/image/google.jpg'),
                  ],
                ),

                const SizedBox(
                  height: 40,
                ),

                //signup
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member Yet?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103)),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
