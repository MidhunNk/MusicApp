import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';
import 'package:music_app/Services/categoryoperation.dart';
import 'package:music_app/Services/musiclistoperation.dart';

import 'package:music_app/Services/musiclistoperation2.dart';
import 'package:music_app/Settings/notificationScreen.dart';
import 'package:music_app/models/category.dart';
import 'package:music_app/models/musiclist.dart';

import 'package:music_app/models/musiclist2.dart';



class MainScreen extends StatelessWidget {
  // Remove const from the constructor
  const MainScreen({Key? key}) : super(key: key);
  Widget ListBlock() => Container(
        width: 200,
        height: 200,
        child: Image.asset("assets/image/demo2.jpg"),
      );
  Widget ListBlock1() => Container(
        width: 200,
        height: 200,
        child: Image.asset("assets/image/demo1.jpg"),
      );
  Widget ListBlock2() => Container(
        width: 200,
        height: 200,
        child: Image.asset("assets/image/demo3.jpg"),
      );
  Widget createCategory(Category category) {
    return Container(
      color: Color.fromARGB(255, 0, 30, 9),
      child: Row(
        children: [
          SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                category.imageUrl,
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 80,
            width: 103,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                category.name,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListCategory() {
    List<Category> categoryList = CategoryOperation.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusicList1(MusicList musiclist) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
          
            height: 180,
            width: 180,
            child: Image.asset(
              musiclist.imageUrl,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            musiclist.name,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 2),
            child: Text(
              musiclist.Desc,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  Widget createMusicList(String label) {
    List<MusicList> musiclists = MusicOperation.getMusic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(213, 0, 32, 9),
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) =>
                  createMusicList1(musiclists[index]),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
















  Widget createMusicListz(MusicList2 musiclist) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Container(
          
            height: 180,
            width: 180,
            child: Image.asset(
              musiclist.imageUrl,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            musiclist.name,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 2),
            child: Text(
              musiclist.Desc,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }

  Widget createMusicListzz(String label) {
    List<MusicList2> musiclists = MusicOperation2.getMusic();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),





















        Container(
          color: Color.fromARGB(213, 0, 32, 9),
          height: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) =>
                  createMusicListz(musiclists[index]),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }













  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 28, 26, 26),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              title: const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Mike Studio",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
              child:const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 115, 255, 0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child:const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.history,
                  color: Color.fromARGB(255, 64, 70, 59),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child:const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
          ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "All",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 72),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Recommended",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 72),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Podcast",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 72),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 6 / 2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          createListCategory()[index]),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              //  const Padding(
              //     padding:  EdgeInsets.only(left: 20),
              //     child: Text(
              //       "KGF Made For You",
              //       textAlign: TextAlign.left,
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 255, 255, 255),
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              createMusicList("KGF Made For You"),
              SizedBox(
                height: 20,
              ),
              createMusicListzz("Playlist For You"),

              // Container(
              //   height: 400,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20),
              //     child: ListView.separated(
              //       itemCount: 4,
              //       separatorBuilder: (context, index) => const SizedBox(
              //         width: 10,
              //       ),
              //       itemBuilder: (context, index) => createMusicList("Hello GOOyis"),

              //       scrollDirection: Axis.horizontal,

              //     ),
              //   ),

              // ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Shows That You Might Like",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                    itemCount: 6,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => ListBlock1(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Recently Played Albums",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                    itemCount: 6,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => ListBlock(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
