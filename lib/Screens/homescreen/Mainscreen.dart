import 'package:flutter/material.dart';

import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 28, 26, 26),
          child: AppBar(
            backgroundColor:const Color.fromARGB(255, 0, 0, 0),
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
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 115, 255, 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.history,
                        color: Color.fromARGB(255, 64, 70, 59),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 251, 251, 251),
                      ),
                    ),
                  ],
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
            height: 15,
          ),
         const Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Text(
              "Today Biggest Hits",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.separated(
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) => ListBlock2(),
                
                scrollDirection: Axis.horizontal,
                
              
               
                
              ),
            ),

          ),
           const Padding(
            padding:  EdgeInsets.only(left: 20),
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
            padding:  EdgeInsets.only(left: 20),
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
