import 'package:flutter/material.dart';
import 'package:music_app/Screens/homescreen/Mainscreen.dart';
import 'package:music_app/Screens/homescreen/settingScreen.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Screens/homescreen/SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final _page = [
    const MainScreen(),
    const PlaylistScreen(),
    const SearchScreen(),
    const PersonScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      body: _page[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,

        //backgroundColor: Colors.black,
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.playlist_add),
              label: "Library"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.settings),
              label: "Settings")
        ],
      ),
    );
  }
}
