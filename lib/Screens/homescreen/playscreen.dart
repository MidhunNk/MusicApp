// import 'package:flutter/material.dart';
// class SearchScreen extends StatelessWidget {
//   const SearchScreen({Key? key});

//   @override
//   Widget build(BuildContext context) {

//     Widget ListBlock4() => Container(
//           width: 200,
//           height: 200,
//           child: Image.asset("assets/image/demo4.jpg"),
//         );
//  Widget GrindBlock() => Container(
//           width: 50,
//           height: 50,
//           child: Image.asset("assets/image/demo5.jpg",fit: BoxFit.fill,),
//         );
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Padding(
//           padding: EdgeInsets.only(left: 15),
//           child: Text(
//             'Search',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 25),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 5),
//                 child: Container(
//                   width: 350,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   child: const TextField(
//                       decoration: InputDecoration(
//                     hintText: "Search for Artists, Songs, Albums",
//                     hintStyle: TextStyle(
//                       color: Color.fromARGB(255, 57, 57, 57),
//                       fontSize: 15,
//                     ),
//                     border: InputBorder.none,
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     ),
//                   )),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15,),
//             const Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 "Picked For You",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//             const Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 "Browse All",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(height: 1,),
//             Container(
//               height: 180,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: ListView.separated(
//                   itemCount: 6,
//                   separatorBuilder: (context, index) => const SizedBox(
//                     width: 10,
//                   ),
//                   itemBuilder: (context, index) => ListBlock4(),
//                   scrollDirection: Axis.horizontal,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             const Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 "Grid View",
//                 textAlign: TextAlign.left,
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//             GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               itemCount: 6,
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) => GrindBlock(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayState createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlayer> {
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inMinutes)}:$twoDigitMinutes';
  }

  late AudioPlayer _audioPlayer;
  double _currentSliderValue = 0;
  Duration _totalDuration = Duration();
  Duration _currentPosition = Duration();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        _currentPosition = duration;
        _currentSliderValue = duration.inSeconds.toDouble();
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
    final url =
        "https://firebasestorage.googleapis.com/v0/b/musicapp-156cc.appspot.com/o/Mp3s%2FOrdinary%20Person%20(From%20_Leo_).mp3.mp3?alt=media&token=c641ce36-9959-4026-8680-769953e9d260";

    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.pause();
    } else {
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
    Duration newPosition = Duration(seconds: seconds.toInt());
    _audioPlayer.seek(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "Search",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search for Artists, Songs, Albums",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 57, 57, 57),
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
                  child: Container(
                    width: size.width - 80,
                    height: size.width - 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 5, 36, 0),
                          offset: Offset(-10, 40),
                          blurRadius: 30,
                          spreadRadius: 5,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
                  child: Container(
                    width: size.width - 80,
                    height: size.width - 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/image/demo11.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.folder_open_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Ordinary Person',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Currently Playing  Ariana',
                      style: TextStyle(
                        color: Color.fromARGB(255, 97, 97, 97),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Slider(
              activeColor: Color.fromRGBO(0, 255, 64, 1),
              value: _currentSliderValue,
              min: 0,
              max: _totalDuration.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });
                seekTo(value);
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_formatDuration(Duration(seconds: _currentSliderValue.toInt()))}', // Update this line
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_formatDuration(_totalDuration)}', // Update this line
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shuffle,
                    color: Color.fromARGB(255, 112, 112, 112),
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print("Button Pressed");
                    print("Player State: ${_audioPlayer.state}");
                    if (_audioPlayer.state == PlayerState.paused ||
                        _audioPlayer.state == PlayerState.stopped) {
                      play();
                    } else {
                      pause();
                    }
                    setState(() {}); // Update the UI
                  },
                  icon: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 255, 64, 1),
                    ),
                    child: Icon(
                      _audioPlayer.state == PlayerState.playing
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.repeat,
                    color: Color.fromARGB(255, 110, 110, 110),
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
                  child: Container(
                    width: size.width - 50,
                    height: size.width - -220,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 24, 24),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 5, 36, 0),
                          offset: Offset(-10, 40),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 1, right: 100),
                      child: Text(
                        'About the Artist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, right: 20),
                      child: Container(
                        width: size.width - 80,
                        height: size.width - 80,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/image/demo2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width - 70,
                      height: size.width - 80,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 20),
                        child: Text(
                          "Ariana Grande is an accomplished American singer, songwriter, and actress born on June 26, 1993, in Boca Raton, Florida. Rising to fame through her role as Cat Valentine on Nickelodeon's Victorious and Sam & Cat, Ariana made a successful transition to a music career.",
                          style: TextStyle(
                            color: Color.fromARGB(255, 198, 197, 197),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MusicPlayer(),
  ));
}
