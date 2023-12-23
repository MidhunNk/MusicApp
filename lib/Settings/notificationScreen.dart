import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> notifications = [
    'You have a new message.',
    'New musics are here.Lets catch up this week',
    '🎉 Your favorite artist just dropped a new album! Check it out now.',
    '🎵 New playlist curated just for you! Discover fresh tracks today.',
    'App update available. Tap to install.',
    // Add more notifications as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),     
           title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white), 
          // Set text color to white
        ),
         centerTitle: true, 
      ),
      body: Container(
        color: Colors.black, // Set the body color to black
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3, // Add elevation for a shadow effect
              color: Colors.grey[900], // Set card background color
              child: ListTile(
                title: Text(
                  notifications[index],
                  style: const TextStyle(color: Colors.white), // Set text color to white
                ),
                // Add more details or actions for each notification
                onTap: () {
                  // Handle notification tap
                  // You can navigate to a detailed view or perform an action
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
