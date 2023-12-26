
// // import 'package:music_app/models/category.dart';

// // class CategoryOperation{
// //   CategoryOperation._();
// //  static List<Category> getCategories(){
// //     return <Category> [
// //       Category('Top Songs', 'assets/image/demo1.jpg'),
// //       Category('Liked Songs', 'assets/image/demo2.jpg'),
// //       Category('Trending', 'assets/image/demo3.jpg'),
// //       Category('Top Hits', 'assets/image/demo4.jpg'),
// //       Category('Leo Das', 'assets/image/demo5.jpg'),
// //       Category('LCU Songs', 'assets/image/demo.jpg'),
      
// //     ];
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/models/category.dart';

class CategoryOperation {
  CategoryOperation._();

  static Future<List<Category>> getCategories() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('SongDetails').get();

      // Use the map function to transform each document snapshot into a Category object
      List<Category> categories = querySnapshot.docs.map((QueryDocumentSnapshot documentSnapshot) {
        String name = documentSnapshot['name'];
        String imagePath = documentSnapshot['imageUrl'];
        String desc = documentSnapshot['description'];


        return Category(name, imagePath, desc);
      }).toList();

      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      // handle the error, e.g., return an empty list or show an error message
      return [];
    }
  }
}


