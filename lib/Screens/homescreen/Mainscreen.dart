import 'package:flutter/material.dart';
import 'package:music_app/Screens/basicScreen/ProfileScreen.dart';

class MainScreen extends StatelessWidget {
  // Remove const from the constructor
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 28, 26, 26),
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            title: Padding(
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
      body: Container(
        child: Column(
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
                        color: Color.fromARGB(255, 201, 255, 216),
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
                        color: Color.fromARGB(255, 201, 255, 216),
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
                        color: Color.fromARGB(255, 201, 255, 216),
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Home Screen here",
                style: TextStyle(color: Colors.white),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
