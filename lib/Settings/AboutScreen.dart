import 'package:flutter/material.dart';
import 'package:music_app/Settings/Creators.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:const Color.fromARGB(255, 17, 15, 15),
      appBar: AppBar(
           leading: const BackButton(color: Colors.white), 
          backgroundColor:const Color.fromARGB(255, 33, 31, 31),
        title:const Text(
          'About',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        centerTitle: true, // Set this to false to manually center the title
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30),
           const ListTile(
            title:  Text('App version : 2.3.3',style: TextStyle(color: Colors.white),),
            
          ),
          ListTile(
            title: const Text('Terms and Conditions',style: TextStyle(color: Colors.white),),
            onTap: () {
              // Handle terms and conditions
            },
          ),
          ListTile(
            title:const Text('Privacy Policy',style: TextStyle(color: Colors.white),),
            onTap: () {
              // Handle privacy policy
            },
          ),
          ListTile(
            title:const Text('Creators',style: TextStyle(color: Colors.white),),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatorsPage()),
              );
              // Handle privacy policy
            },
          ),
        ],
      ),
    );
  }
}