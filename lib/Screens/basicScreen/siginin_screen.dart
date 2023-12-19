import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color.fromARGB(31, 15, 15, 15),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 49,),
            //musicapp logo
              logow(),
            //Hola Amigo
              
          
            //username
          
            //password
          
            //forgot
          
            //signin
          
            //extra op
          
            //signup
          ],
          ),
        ),
      ),
    );
  }
}

class logow extends StatelessWidget {
  const logow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return logow();
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


