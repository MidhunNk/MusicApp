import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';
import 'package:music_app/Services/categoryoperation.dart';
import 'package:music_app/Services/grind.dart';
import 'package:music_app/Services/musiclistOperation.dart';

import 'package:music_app/Settings/notificationScreen.dart';
import 'package:music_app/models/category.dart';
import 'package:music_app/models/grindclass.dart';
import 'package:music_app/models/musiclist.dart';

class MainScreen extends StatefulWidget {
  // Remove const from the constructor
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<List1> categorieslist = [];
  List<Category> categories = [];
  List<Grindclass> grindclass = [];
  @override
  void initState() {
    super.initState();
    loadCategories();
    loadGrind();
    loadlist1();
    
  }

  Widget playlistofLeo(Category category) {
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
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            category.name,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Text(
              category.description,
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

  Future<void> loadCategories() async {
    List<Category> loadedCategories = await CategoryOperation.getCategories();
    setState(() {
      categories = loadedCategories;
    });
  }

  Widget createCategory(Category category) {
    return Container(
      color: Color.fromARGB(255, 0, 30, 9),
      child: Row(
        children: [
          SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
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



  Widget grindcategory( Grindclass grindclass) {
    return Container(
      color: Color.fromARGB(255, 0, 30, 9),
      child: Row(
        children: [
          SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                grindclass.imageUrl,
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 80,
            width: 103,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                grindclass.name,
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


Future<void> loadGrind() async {
    List<Grindclass> loadGrind = await Grindoperation.getGrind();
    setState(() {
      grindclass = loadGrind;
    });
  }





  Widget createMusicList1(List1 categorieslist) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
            height: 180,
            width: 180,
            child: Image.network(
              categorieslist.imageUrl,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            categorieslist.name,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 2),
            child: Text(
              categorieslist.description,
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

  Future<void> loadlist1() async {
    List<List1> loadedCategories1 = await List1Operation.getList1();
    setState(() {
      categorieslist = loadedCategories1;
    });
  }

  Widget createMusicList(String label) {
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
              itemCount: categorieslist.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) =>
                  createMusicList1(categorieslist[index]),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }

  Widget createMusicListkgf(String label) {
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
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) =>
                  createMusicList1(categorieslist[index]),
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
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()),
                    );
                  },
                  child: const Padding(
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
                  child: const Padding(
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
                  child: const Padding(
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
                          grindcategory(grindclass[index])),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              createMusicList("Playlist From KGF"),
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
                color: Color.fromARGB(213, 0, 32, 9),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) =>
                        playlistofLeo(categories[index]),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
