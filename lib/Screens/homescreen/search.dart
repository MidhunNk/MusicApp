import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, required List<Map<String, dynamic>> items})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Map<String, dynamic>> items = [];
  late List<Map<String, dynamic>> searchResults = [];
  bool isLoaded = false;
  final CollectionReference _items =
      FirebaseFirestore.instance.collection("SongDetails");

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      QuerySnapshot data = await _items.get();

      print("Number of documents: ${data.docs.length}");

      List<Map<String, dynamic>> tempList = [];
      data.docs.forEach((element) {
        tempList.add(element.data() as Map<String, dynamic>);
      });

      setState(() {
        items = tempList;
        isLoaded = true;
        print("items loaded");
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  void _performSearch(String query) {
    setState(() {
      searchResults = items
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search Songs...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {
            _performSearch(value);
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: !isLoaded
          ? Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 71, 245, 55),
                ),
              ),
            )
          : Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(items[index]["imageUrl"]),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchResults[index]['name'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 71, 245, 55),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              items[index]["Artist"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              items[index]["description"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
