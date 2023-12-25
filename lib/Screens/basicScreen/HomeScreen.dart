import 'package:flutter/material.dart';
import 'package:music_app/Screens/homescreen/Mainscreen.dart';
import 'package:music_app/Screens/homescreen/settingScreen.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Screens/homescreen/playscreen.dart';
import 'package:flutter/src/widgets/media_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final _page = [
    const MainScreen(),
    const MusicPlayer(),
     PlaylistScreen(),
    const PersonScreen(),
  ];

  miniPlayer() {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MusicPlayer()));
      },
      child: AnimatedContainer(
      
        duration: const Duration(milliseconds: 500),
        color: Colors.green,
        width: deviceSize.width,
        height: 55,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('assets/image/playdemo.jpg'),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Every Day",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Ariana Grande",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                         
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Color.fromARGB(255, 9, 255, 0),
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30,
                      )),
      
                      
                         IconButton(
                         highlightColor: Colors.red,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
      
                        
                        color: Colors.white,
                        size: 25,
                      )),
                ]))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      body: Column(
        children: [
          Expanded(
            child: _page[_currentindex],
          ),
          if (_currentindex != 1) miniPlayer(),
        ],
      ),
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
              icon: Icon(Icons.music_video),
              label: "Play"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.playlist_add),
              label: "Library"),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.settings),
              label: "Settings")
        ],
      ),
    );
  }
}
