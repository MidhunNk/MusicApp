import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:music_app/Screens/basicScreen/HomeScreen.dart';
import 'package:music_app/Screens/basicScreen/authenticate.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: AuthPage(),
    );
  }
}
