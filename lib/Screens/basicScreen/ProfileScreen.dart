import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/Screens/homescreen/Playlistscreen.dart';
import 'package:music_app/Settings/adddata.dart';
import 'package:music_app/Settings/utils.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<Map<String, dynamic>> items = [];

  bool isLoaded = false;

  
  _incrementCounter() async {
    try {
      List<Map<String, dynamic>> tempList = [];
      QuerySnapshot data = await firestore.collection("userProfile").get();

      print("Number of documents: ${data.docs.length}");

      data.docs.forEach((element) {
        tempList.add(element.data() as Map<String, dynamic>);
      });

      setState(() {
        items = tempList;
        isLoaded = true;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async{

      String name = nameController.text;
      String bio = bioController.text;

      String resp = await StoreData().saveData(name: name, bio: bio, file: _image!);
  }

  late TextEditingController nameController;
  late TextEditingController bioController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _incrementCounter();
    nameController = TextEditingController(text: 'Aswaj');
    bioController = TextEditingController(text: 'its suiii time....');
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 15, 15),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
              child: Column(
                children: [
                   Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      :  CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(items[0]["imageLink"]
                              ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
              height: 20,
            ),
                  
                  const Text(
                    'aswajc@mail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Name:',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            if (isEditing)
              TextFormField(
                controller: nameController,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 175, 170, 170),
                ),
              )
            else
              Text(
                nameController.text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 20),
            const Text(
              'Bio',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            if (isEditing)
              TextFormField(
                controller: bioController,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 175, 170, 170),
                ),
              )
            else
              Text(
                bioController.text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: toggleEditMode,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 140,
                  right: 140,
                ),
                child: Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
