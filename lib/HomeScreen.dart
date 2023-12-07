import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Color.fromARGB(255, 33, 31, 31),
    appBar:  AppBar(
      backgroundColor: Color.fromARGB(255, 28, 26, 26),
    ),
     body: SafeArea(child: Text("HEllo")),
    );
  }
}