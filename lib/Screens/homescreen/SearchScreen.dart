import 'package:flutter/material.dart';

class SearchScreen
 extends StatelessWidget {
  const SearchScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text("Search Screen here",style: TextStyle(
        color: Colors.white
      ),),
      ),
    );
  }
}