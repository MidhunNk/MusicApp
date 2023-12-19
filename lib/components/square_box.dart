import 'package:flutter/material.dart';

class SquareBox extends StatelessWidget {
  final String imagepath;
  const SquareBox({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 11, 185, 43),
      ),
      child: Image.asset(
        imagepath,
        height: 40,
      ),
    );
  }
}
