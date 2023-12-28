import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:music_app/Screens/homescreen/Mainscreen.dart';
import 'package:music_app/Screens/homescreen/settingScreen.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Screens/homescreen/playscreen.dart';
import 'package:music_app/models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  var _page = [];

  AudioPlayer _audioPlayer = new AudioPlayer();
  bool isLoaded = false;

  bool isPlaying = false;
  Category? music;

  
  List<Category> musicList = [];
  
  void playnext() async {
  int currentIndex = musicList.indexOf(music!);
  if (currentIndex == musicList.length - 1) {
    currentIndex = 0;
  } else {
    currentIndex++;
  }
  print("playnext: currentIndex is $currentIndex");
  updateMiniPlayer(musicList[currentIndex]);
}

void playprevious() async {
  int currentIndex = musicList.indexOf(music!);
  print("playprevious: currentIndex before: $currentIndex");
  if (currentIndex == 0) {
    currentIndex = musicList.length - 1;
  } else {
    currentIndex--;
  }
  print("playprevious: currentIndex after: $currentIndex");
  updateMiniPlayer(musicList[currentIndex]);
}








void updateMiniPlayer(Category? newMusic) async {
  if (newMusic == null) {
    // Reset mini player state when no new music is available
    isPlaying = false;
    await _audioPlayer.stop();
  } else if (music == newMusic) {
    // Toggle play/pause state if the same song is played again
    isPlaying = !isPlaying;
    if (isPlaying) {
      await _audioPlayer.resume();
    } else {
      await _audioPlayer.pause();
    }
  } else {
    // Play the new song and update mini player state
    music = newMusic;
    isPlaying = true;
    await _audioPlayer.play(UrlSource(music!.songUrl));
  }
  print("music is $music");

  setState(() {});
}



  

  Widget miniPlayer(Category? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    return Container(
      color: Colors.green,
      width: 390,
      height: 55,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(music.imageUrl),
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
                  music.name,
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
                  music.description,
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
            padding: const EdgeInsets.only(right: 2),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    //playprevious();
                    playprevious();
                  },
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    updateMiniPlayer(music);
                  },
                  icon: Icon(
                    isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Color.fromARGB(255, 6, 235, 56),
                    size: 40,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //playnext();
                    playnext();
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
    );
  }

  @override
  initState() {
    super.initState();
    _page = [
      MainScreen(updateMiniPlayer),
      const MusicPlayer(),
      PlaylistScreen(),
      const PersonScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
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
          if (_currentindex != 1) miniPlayer(music),
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
