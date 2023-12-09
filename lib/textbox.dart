import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;

  const MyTextBox({
    Key? key,
    required this.text,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 136, 129, 129),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: const TextStyle(color: Color.fromARGB(255, 68, 65, 65)),
              ),
              IconButton(
                onPressed: () {
                  _showSettingsDialog(context);
                },
                icon:const Icon(Icons.edit),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration:const InputDecoration(labelText: 'New Name'),
                // Handle the onChanged callback to update the name
                onChanged: (newName) {
                  // Handle the updated name
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'New Bio'),
                // Handle the onChanged callback to update the bio
                onChanged: (newBio) {
                  // Handle the updated bio
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child:const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle saving the updated information
                Navigator.pop(context); // Close the dialog
              },
              child:const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}