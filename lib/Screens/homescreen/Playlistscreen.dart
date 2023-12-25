import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class PlaylistScreen extends StatefulWidget {
  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final CollectionReference _items = FirebaseFirestore.instance.collection("SongDetails");

  File? _selectedImage;
  File? _selectedAudio;

  Future<void> _upload([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text("Upload Music",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: "Song Name", hintText: "Name"),
              ),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Artist Name, Album Name, etc."),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Pick image
                    final imagePicker = ImagePicker();
                    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

                    if (pickedImage != null) {
                      setState(() {
                        _selectedImage = File(pickedImage.path!);
                      });
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Upload Thumbnail"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Pick audio file
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.audio,
                      allowMultiple: false,
                    );

                    if (result != null && result.files.isNotEmpty) {
                      setState(() {
                        _selectedAudio = File(result.files.first.path!);
                      });
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.music_note),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Add Music"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 58, 124, 232),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 58, 124, 232),
                    ),
                    onPressed: () async {
                      // Upload image and audio to Firebase Storage
                      if (_selectedImage != null && _selectedAudio != null) {
                        try {
                          // Upload image
                          final imageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
                          await imageRef.putFile(_selectedImage!);

                          // Upload audio
                          final audioRef = FirebaseStorage.instance.ref().child('audios/${DateTime.now().millisecondsSinceEpoch}.mp3');
                          await audioRef.putFile(_selectedAudio!);

                          // Get the download URLs
                          final imageUrl = await imageRef.getDownloadURL();
                          final audioUrl = await audioRef.getDownloadURL();

                          final String name = _nameController.text;
                          final String desc = _descController.text;

                          if (name.isNotEmpty && desc.isNotEmpty) {
                            await _items.add({
                              "name": name,
                              "description": desc,
                              "imageUrl": imageUrl,
                              "songUrl": audioUrl,
                            });

                            _nameController.text = '';
                            _descController.text = '';
                            _selectedImage = null;
                            _selectedAudio = null;

                            Navigator.of(context).pop();

                            // Show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                           const   SnackBar(
                                content: Text('Uploaded successfully!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } catch (e) {
                          print('Error uploading: $e');
                          // Show snackbar for error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error uploading: $e'),
                              duration:const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.music_note, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Upload", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
      QuerySnapshot data = await firestore.collection("SongDetails").get();

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
              children: [
                Container(
                  height: 500,
                  width: 400,
                  color: const Color.fromARGB(255, 26, 25, 25),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: isLoaded
                        ? ListView.separated(
                            itemCount: items.length,
                            separatorBuilder: (context, index) =>
                                const Divider(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            itemBuilder: (context, index) => ListTile(
                              leading:  CircleAvatar(
                                backgroundImage:
                                    NetworkImage(items[index]["imageUrl"]),
                                radius: 30,
                              ),
                              title: Text(
                                items[index]["name"],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle:  Text(items[index]["description"]
                                ,
                              ),
                            ),
                            scrollDirection: Axis.vertical,
                          )
                        : const Center(child:  Text("Loading...", style: TextStyle(color: Colors.white))),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(top: 420, left: 320),
                  child: FloatingActionButton(
                    child: Icon(Icons.queue_music_sharp,
                        color: Color.fromARGB(255, 44, 44, 44)),
                    backgroundColor: Color.fromARGB(255, 46, 255, 5),
                    elevation: 0,
                    onPressed: () {
                      _upload();
                    },
                  ),
                ),
              ],
            )
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

class UploadFirebase extends StatefulWidget {
  const UploadFirebase({Key? key}) : super(key: key);

  @override
  State<UploadFirebase> createState() => _UploadFirebaseState();
}

class _UploadFirebaseState extends State<UploadFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
