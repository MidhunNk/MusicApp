import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPlay extends StatefulWidget {
  const MusicPlay({super.key});

  @override
  State<MusicPlay> createState() => _MusicPlayState();
}

class _MusicPlayState extends State<MusicPlay> {
  double _currentslidervalue = 20;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: getAppbar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                              spreadRadius: 5)
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
                  child: Container(
                    width: size.width - 80,
                    height: size.width - 80,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/image/playdemo.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
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
                    )),
                SizedBox(
                  width: 70,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'EveryDay',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Currently Playing  Ariana',
                      style: TextStyle(
                          color: Color.fromARGB(255, 97, 97, 97),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Slider(
                activeColor: Color.fromRGBO(0, 255, 64, 1),
                value: _currentslidervalue,
                min: 0,
                max: 200,
                onChanged: (value) {
                  setState(() {
                    _currentslidervalue = value;
                  });
                }),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //SizedBox(width: 20,),
                  Text(
                    '1:20',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(width: 250,),
                  Text(
                    '3:20',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 255, 64, 1),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 30,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.repeat,
                      color: Color.fromARGB(255, 110, 110, 110),
                      size: 30,
                    )),
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
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(children: [
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
                            spreadRadius: 5)
                      ]),
                ),
              ),
              Column(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 40, left: 1, right: 100),
                      child: Text(
                        'About the Artist',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 20),
                  child: Container(
                    width: size.width - 80,
                    height: size.width - 80,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/image/demo2.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),

                  SizedBox(
                    width: size.width - 70,
                    height: size.width - 80,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 20),
                        child: Text(
                          "Ariana Grande is an accomplished American singer, songwriter, and actress born on June 26, 1993, in Boca Raton, Florida. Rising to fame through her role as Cat Valentine on Nickelodeon's Victorious and Sam & Cat, Ariana made a successful transition to a music career. ",
                          style: GoogleFonts.roboto(
                            color: Color.fromARGB(255, 198, 197, 197),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        )),
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}

Widget getAppbar() {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ))
    ],
  );
}
