import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  double _currentVolume = 0.5; // Initial volume value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: const BackButton(color: Colors.white),
        title: const Text('Audio Player',style: TextStyle(
            color:  Color.fromARGB(255, 255, 255, 255), // Set text color to white
            fontWeight: FontWeight.bold, // Optional: Adjust font weight
          ),),
            backgroundColor:const Color.fromARGB(255, 33, 31, 31),
             automaticallyImplyLeading: false, // Optional: Remove back button
        centerTitle: true,
      ),
      
      backgroundColor:const Color.fromARGB(255, 17, 15, 15),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Volume controller
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Slider(
                value: _currentVolume,
                onChanged: (double value) {
                  setState(() {
                    _currentVolume = value;
                    // Handle volume change
                  });
                },
                min: 0.0,
                max: 1.0,
                activeColor: Colors.blue, // Set the active color of the slider
                inactiveColor: Colors.grey, // Set the inactive color of the slider
              ),
            ),
          ],
        ),
      ),
    );
  }
}