import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Settings/AboutScreen.dart';
import 'package:music_app/Settings/FeedBackScreen.dart';
import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';
import 'package:music_app/Settings/AudioScreen.dart';
import 'package:music_app/Settings/dataUsageScreen.dart';
import 'package:music_app/Settings/notificationScreen.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 15, 15),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        title: const Text(
          'Settings',
          style: TextStyle(
            color:
                Color.fromARGB(255, 255, 255, 255), // Set text color to white
            fontWeight: FontWeight.bold, // Optional: Adjust font weight
          ),
        ),
        automaticallyImplyLeading: false, // Optional: Remove back button
        centerTitle: true, // Set this to false to manually center the title
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Account Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              // Handle account settings
            },
          ),
          ListTile(
            title: const Text(
              'Audio Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AudioPage()),
              );
              // Handle audio settings
            },
          ),
          ListTile(
            title: const Text(
              'Theme and Appearance',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle theme and appearance settings
            },
          ),
          ListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
              // Handle notification settings
            },
          ),
          ListTile(
            title: const Text(
              'Offline Playback',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlaylistScreen()),
              );
              // Handle offline playback settings
            },
          ),
         const ListTile(
            title: Text('Language :  English',style: TextStyle(color: Colors.white),),
            
          ),
          const ListTile(
            title: Text('Region :  India',style: TextStyle(color: Colors.white),),
            
          ),
          ListTile(
            title: const Text(
              'Privacy and Security',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle privacy and security settings
            },
          ),
          ListTile(
            title: const Text(
              'Feedback and Support',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackScreen()),
              );
              // Handle feedback and support settings
            },
          ),
          ListTile(
            title: const Text(
              'About',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Data Usage',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataUsagePage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Accessibility',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Handle accessibility settings
            },
          ),
        ],
      ),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
