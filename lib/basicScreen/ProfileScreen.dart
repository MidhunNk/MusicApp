import 'package:flutter/material.dart';
import 'package:music_app/accountbox.dart';
import 'package:music_app/textbox.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: BackButton(color: Colors.white), 
        title:const Text(
          'PROFILE   PAGE',
          style: TextStyle(color: Color.fromARGB(255, 240, 243, 245)),
        ),
        backgroundColor: const Color.fromARGB(255, 28, 26, 26),
        centerTitle: true,
      ),

      body:ListView (children: const [
         SizedBox(
        height: 40,
        ),
        //profile pic
         Icon(Icons.person,size: 70,color: Colors.white,),

         Text('aswajemail@mail.com',
         textAlign: TextAlign.center,
         style: TextStyle(color: Colors.white),),
      

        //name
        Padding(
          padding: EdgeInsets.only(left:25,top: 35),
          child: Text('My Details',
          style: TextStyle(color: Colors.white),),
        ),

        MyTextBox(
          text:'Aswaj',
         sectionName: 'username',
         ),

         MyTextBox(
          text:'abracadabraaaa',
         sectionName: 'Bio',),

         MyTextiBox(text: 'Free', sectionName: 'Account'),
        




        //mail

        //details

      ],),
    );
  }
}
