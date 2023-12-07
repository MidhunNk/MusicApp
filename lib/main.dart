import 'package:flutter/material.dart';
import 'package:music_app/home.dart';

void main()
{
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(
      
      ),
    );
  }
}