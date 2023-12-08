import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text("Settings Screen here",style: TextStyle(
        color: Colors.white
      ),),
      ),
    );
  }
}