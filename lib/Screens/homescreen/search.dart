// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: SearchScreen(),
//   ));
// }

// class SearchScreen extends StatefulWidget {
//   SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController searchController = TextEditingController();
//   late List<Map<String, dynamic>> items = [];
//   late List<Map<String, dynamic>> searchResults = [];
//   bool isLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   _fetchData() async {
//     try {
//       QuerySnapshot data =
//           await FirebaseFirestore.instance.collection("SongDetails").get();

//       print("Number of documents: ${data.docs.length}");

//       List<Map<String, dynamic>> tempList = [];
//       data.docs.forEach((element) {
//         tempList.add(element.data() as Map<String, dynamic>);
//       });

//       setState(() {
//         items = tempList;
//         isLoaded = true;
//       });
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   void _performSearch(String query) {
//     setState(() {
//       searchResults = items
//           .where((element) => element['name']
//               .toString()
//               .toLowerCase()
//               .contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: searchController,
//           decoration: const InputDecoration(
//             hintText: 'Search Songs...',
//             hintStyle: TextStyle(color: Colors.white70),
//             border: InputBorder.none,
//           ),
//           style: const TextStyle(color: Colors.white),
//           onChanged: (value) {
//             _performSearch(value);
//           },
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: isLoaded
//           ? ListView.builder(
//               itemCount: searchResults.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(searchResults[index]['items']),
//                   // Add more details as needed
//                 );
//               },
//             )
//           : const Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // Other asynchronous tasks
    runApp(MyApp());
  } catch (e) {
    print('Error initializing app: $e');
    // Handle errors gracefully
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(
        items: [],
      ),
    );
  }
}

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
          .where((element) =>
              element['name'].toString().toLowerCase().substring(0, 3) ==
              query.toLowerCase().substring(0, query.length))
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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]['name']),
                );
              },
            ),
    );
  }
}
