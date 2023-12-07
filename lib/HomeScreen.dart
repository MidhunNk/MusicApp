import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 26, 26),
      ),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List items = [
      Icons.home,
      Icons.playlist_add,
      Icons.search,
      Icons.settings,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
              icon: Icon(
                items[index],
                color: activeTab == index ? Colors.blue : Colors.white,
              ),
            );
          }),
        ),
      ),
    );
  }
}


