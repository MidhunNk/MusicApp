

 import 'package:music_app/models/musiclist.dart';

// class List1Operation {
//   List1Operation._();
//   static List<List1> getMusic(){
//     return <List1>[List1('Toofan','assets/image/demolist.jpg','"Toofan" is a song from KGF Chapter 2'),
//     List1('Sulthan','assets/image/demolist2.jpg','"Sulthan" is a song from KGF Chapter 2'),
//     List1('Mehabuba','assets/image/demolist3.jpg','"Mehabuba" is a song from KGF Chapter 2'),
//     List1('Salam Rocky','assets/image/demolist4.jpg','"Salam" is a song from KGF Chapter 2')];
    
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/models/category.dart';

class List1Operation {
  List1Operation._();

  static Future<List<List1>> getList1() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('SongKgf').get();

      // Use the map function to transform each document snapshot into a Category object
      List<List1> categories1 = querySnapshot.docs.map((QueryDocumentSnapshot documentSnapshot) {
        String name = documentSnapshot['name'];
        String imagePath = documentSnapshot['imageUrl'];
        String desc = documentSnapshot['description'];


        return List1(name, imagePath, desc);
      }).toList();

      return categories1;
    } catch (e) {
      print('Error fetching categories: $e');
      // handle the error, e.g., return an empty list or show an error message
      return [];
    }
  }
}




