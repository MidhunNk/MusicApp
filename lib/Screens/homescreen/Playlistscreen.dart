import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../basicScreen/ProfileScreen.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<String> uploadFile(String filename, File file) async {
  try {
    final reference = FirebaseStorage.instance.ref().child("Mp3s/$filename.mp3");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() => null);
    final downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Error uploading file: $e");
    return ""; // Handle the error appropriately
  }
}

void pickFile() async {
  try {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (pickedFile != null) {
      final file = File(pickedFile.files.single.path!);
      final String fileName = pickedFile.files.single.name;
      final downloadUrl = await uploadFile(fileName, file);
      print("Download URL: $downloadUrl");

      await firestore.collection("Mp3s").add({"url": downloadUrl, "name": fileName});
      print("MP3 added to Firestore");
    } else {
      print("No file selected");
    }
  } catch (e) {
    print("Error picking/uploading file: $e");
    // Handle the error appropriately
  }
}

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  Widget ListBlock2() => Container(
        width: 200,
        height: 200,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 28, 26, 26),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            title: const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Your Library",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 115, 255, 0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 251, 251, 251),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Playlists",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 72),
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Artists",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 72),
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Albums",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 72),
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.sort,color: Colors.white,)),
                ),
                const Text("Recently Played",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            Container(
              height: 400,
              width: 400,
              color: const Color.fromARGB(255, 26, 25, 25),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ListView.separated(
                  itemCount: 25,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (context, index) => Text("Hello $index", style: TextStyle(color: Colors.white, fontSize: 20)),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
            const SizedBox(height: 20,),
           const Padding(
              padding:  EdgeInsets.only(top :1, right: 12 ,),
              child: FloatingActionButton(
                onPressed: pickFile,
                child: Icon(Icons.queue_music_sharp, color: Color.fromARGB(255, 44, 44, 44)),
                backgroundColor: Color.fromARGB(255, 46, 255, 5),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: PlaylistScreen(),
  ));
}
