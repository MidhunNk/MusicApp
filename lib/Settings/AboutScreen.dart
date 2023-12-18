import 'package:flutter/material.dart';

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
          const Padding(
            padding:  EdgeInsets.only(left:20,right:20,top:20),
            child:  Text(
              '2.2.5.5',
              style: TextStyle(
                color: Colors.white,        
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),                      
          ),
          const SizedBox(), // Adjust the height between the two Text widgets
          const Text(
            'App version', // Add your additional information
            style: TextStyle(
              fontSize: 15,
             fontWeight: FontWeight.bold,
             color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(height: 50), // Adjust the height between the two Text widgets
          const Text(
            'Release Date: December 07, 2023', // Add your additional information
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 208, 203, 203),
            ),
          ),
          const SizedBox(height: 30),
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
        ],
      ),
    );
  }
}