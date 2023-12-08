import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text("Main Screen here",style: TextStyle(
        color: Colors.white
      ),)),
    );
  }
}