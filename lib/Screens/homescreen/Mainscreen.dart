import 'package:flutter/material.dart';
import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 26, 26),
        title: const Padding(
          padding: EdgeInsets.only(left: 13),
          child: Text(
            "Mike Studio",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        /* actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.person,
            color: Colors.white,
            
            
          ),
        )
      ],
    ),
   */
        actions: [
          // Wrap the IconButton in a GestureDetector to handle the tap
          GestureDetector(
            onTap: () {
              // Navigate to the profile page when the person icon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Home Screen here",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
