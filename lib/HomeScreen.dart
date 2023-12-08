import 'package:flutter/material.dart';
import 'package:music_app/homescreen/Mainscreen.dart';
import 'package:music_app/homescreen/PersonScreen.dart';
import 'package:music_app/homescreen/Playlistscreen.dart';
import 'package:music_app/homescreen/SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final _page =[
    MainScreen(),PlaylistScreen(),SearchScreen(),PersonScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 26, 26),
      ),
      body: _page [_currentindex],
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
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.playlist_add),
              label: "Playlist"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.person),
              label: "Person")
        ],
      ),
    );
  }
}
