/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadCard(),
    );
  }
}

class UploadCard extends StatefulWidget {
  @override
  _UploadCardState createState() => _UploadCardState();
}

class _UploadCardState extends State<UploadCard> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _songController = TextEditingController();
  final _imageController = TextEditingController();

  Future<void> _uploadData() async {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final song = _songController.text;
    final image = _imageController.text;

    final imageRef = FirebaseStorage.instance.ref().child('images/$image.jpg');
    final songRef = FirebaseStorage.instance.ref().child('songs/$song.mp3');

    final imageTask = imageRef.putFile(image as File);
    final songTask = songRef.putFile(song as File);

    final imageSnapshot = await imageTask.whenComplete(() {});
    final songSnapshot = await songTask.whenComplete(() {});

    final imageUrl = await imageSnapshot.ref.getDownloadURL();
    final songUrl = await songSnapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('data').add({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'songUrl': songUrl,
    });

    _titleController.clear();
    _descriptionController.clear();
    _songController.clear();
    _imageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Card'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _songController,
              decoration: InputDecoration(
                labelText: 'Song',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a song';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(
                labelText: 'Image',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an image';
                }
                return null;
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _uploadData();
                }
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: uploadall(),
    );
  }
}

Future<String> uploadImg(String filename, File file) async {
  try {
    final reference =
        FirebaseStorage.instance.ref().child("SongDetails/$filename.jpeg");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() => null);
    final downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Error uploading file: $e");
    return ""; // Handle the error appropriately
  }
}

class uploadall extends StatefulWidget {
  const uploadall({super.key});

  @override
  State<uploadall> createState() => _uploadallState();
}

class _uploadallState extends State<uploadall> {
  //firldtext
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("SongDetails");

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
                  child: Text("Upload all"),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Song Name", hintText: "Ordinary Person"),
                ),
                TextField(
                  controller: _descController,
                  decoration: const InputDecoration(
                      labelText: "Description",
                      hintText: "It's a song by Anirudh in movie leo"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: IconButton(
                        onPressed: () async {
                          /*final file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (file == null) return;
                          String fileName =
                              DateTime.now().microsecondsSinceEpoch.toString();
                          final file = File(fileName.path!);

                          //to storage ref
                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDireImage =
                              referenceRoot.child('SongImages');

                          //ref for im
                          Reference referenceImageToUpload =
                              referenceDireImage.child(fileName);

                          //error handle
                          
                          try {
                            await referenceImageToUpload
                                .putFile(File(file.path));
                          } catch (error) {
                            print('some error');
                          }
                          uploadImg(fileName, file);*/
                        },
                        icon: const Icon(Icons.camera))),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.music_note),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        final String name = _nameController.text;
                        final String desc = _descController.text;
                        if (name != null) {
                          await _items.add({
                            "name": name,
                            "description": desc,
                          });
                          _nameController.text = '';
                          _descController.text = '';
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text("Create")),
                )
              ],
            ),
          );
        });
  }

  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection("SongDetails").snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error!!!${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;

            //map selection
            List<Map> items = document.map((e) => e.data() as Map).toList();

            //return list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Map thisItems = items[index];
                  return ListTile(
                    title: Text("${thisItems['name']}"),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _upload();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
