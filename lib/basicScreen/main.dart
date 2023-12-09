import 'package:flutter/material.dart';
import 'package:music_app/HomeScreen.dart';


void main()
{
  
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
       
      ),
      home: HomeScreen(
    
      ),
    );
  }
}