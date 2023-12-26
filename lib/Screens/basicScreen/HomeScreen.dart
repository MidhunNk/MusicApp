import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:music_app/Screens/homescreen/Mainscreen.dart';
import 'package:music_app/Screens/homescreen/settingScreen.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Screens/homescreen/playscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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

  int index1 = 0;
  late AudioPlayer _audioPlayer;
  double _currentSliderValue = 0;
  Duration _totalDuration = Duration();
  Duration _currentPosition = Duration();

  late List<Map<String, dynamic>> items = [];
  bool isLoaded = false;

  _incrementCounter() async {
    try {
      List<Map<String, dynamic>> tempList = [];
      QuerySnapshot data = await firestore.collection("SongDetails").get();

      print("Number of documents: ${data.docs.length}");

      data.docs.forEach((element) {
        tempList.add(element.data() as Map<String, dynamic>);
      });

      setState(() {
        items = tempList;
        isLoaded = true;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _incrementCounter();
    _audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        _currentPosition = duration;
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        // Update the UI based on player state if needed
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> play() async {
    if (items.isNotEmpty && index1 >= 0 && index1 < items.length) {
      final url = items[index1]["songUrl"];
      if (_audioPlayer.state == PlayerState.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(UrlSource(url));
      }
    }
  }

  Future<void> play1() async {
    if (items.isNotEmpty && index1 >= 0 && index1 < items.length) {
      final url = items[index1]["songUrl"];
      await _audioPlayer.play(UrlSource(url));
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void seekTo(double seconds) {
    if (items.isNotEmpty && index1 >= 0 && index1 < items.length) {
      Duration newPosition = Duration(seconds: seconds.toInt());
      _audioPlayer.seek(newPosition);
    }
  }

  void playNext() {
    if (index1 < items.length - 1) {
      index1++;
      play1();
    }
  }

  void playPrevious() {
    if (index1 > 0) {
      index1--;
      play1();
    }
  }

  Widget miniPlayer(List<Map<String, dynamic>> items, int index1) {
    if (items.isEmpty || index1 < 0 || index1 >= items.length) {
      return Container(); // Return an empty container or another widget as needed
    }

    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPlayer()));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: Colors.green,
        width: 390,
        height: 55,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, ),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(items[index1]["imageUrl"]),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 170,
                  child: Text(
                    items[index1]["name"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                   height: 20,
                  width: 170,
                  child: Text(
                    items[index1]["description"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only( right: 2),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      playPrevious();
                    },
                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (items.isNotEmpty && index1 >= 0 && index1 < items.length) {
                        // Handle play button click
                        play();
                      }
                    },
                    icon: Icon(
                      _audioPlayer.state == PlayerState.playing
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Color.fromARGB(255, 6, 235, 56),
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {playNext();
                    },
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        body: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [Colors.white],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      body: Column(
        children: [
          Expanded(
            child: _page[_currentindex],
          ),
          if (_currentindex != 1) miniPlayer(items, index1),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
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
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.music_video),
            label: "Play",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.playlist_add),
            label: "Library",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
    );
  }
}


