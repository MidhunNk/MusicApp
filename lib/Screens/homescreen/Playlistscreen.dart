import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<String> uploadFile(String filename, File file) async {
  try {
    final reference =
        FirebaseStorage.instance.ref().child("Mp3s/$filename.mp3");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() => null);
    final downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Error uploading file: $e");
    return ""; // Handle the error appropriately
  }
}

void pickFiles() async {
  try {
    final FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
      allowMultiple: true, // Enable multiple file selection
    );

    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      for (final PlatformFile pickedFile in pickedFiles.files) {
        final file = File(pickedFile.path!);
        final String fileName = pickedFile.name;
        final downloadUrl = await uploadFile(fileName, file);
        print("Download URL: $downloadUrl");

        await firestore
            .collection("Mp3s")
            .add({"url": downloadUrl, "name": fileName});
        print("MP3 added to Firestore");
      }
    } else {
      print("No files selected");
    }
  } catch (e) {
    print("Error picking/uploading files: $e");
    // Handle the error appropriately
  }
}

class PlaylistScreen extends StatefulWidget {
  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late List<Map<String, dynamic>> items = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _incrementCounter();
  }

  _incrementCounter() async {
    try {
      List<Map<String, dynamic>> tempList = [];
      QuerySnapshot data = await firestore.collection("Mp3s").get();

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
                  // Navigating to the ProfileScreen
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
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sort, color: Colors.white)),
                ),
                const Text("Recently Played",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Stack(
              children: [Container(
                height: 500,
                width: 400,
                color: const Color.fromARGB(255, 26, 25, 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: isLoaded
                      ?ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemBuilder: (context, index) => ListTile(
                  //tileColor: Color.fromARGB(255, 64, 68, 64),
                  leading: const CircleAvatar(
                  //  backgroundImage: NetworkImage(items[index]["avatarUrl"]), // Use the URL of the avatar image
                  backgroundImage: AssetImage("assets/image/demo.jpg"),radius: 30,
                  ),
                  title: Text(
                    items[index]["name"],
                    
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle:const Text("des",
                   // items[index]["description"],
                   // style: TextStyle(fontSize: 14),
                  ),
                ),
                scrollDirection: Axis.vertical,
              ) :const Text("Loading...")
              
                ),
              ),
          
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 420, left: 320),
              child: FloatingActionButton(
                onPressed: pickFiles,
                child: Icon(Icons.queue_music_sharp,
                    color: Color.fromARGB(255, 44, 44, 44)),
                backgroundColor: Color.fromARGB(255, 46, 255, 5),
                elevation: 0,
              ),
            ),
          ],
       ) ],),
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
