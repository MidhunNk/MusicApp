import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text("Playlist Screen here",style: TextStyle(
        color: Colors.white
      ),),
      ),
    );
  }
}