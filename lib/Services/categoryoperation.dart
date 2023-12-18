
import 'package:music_app/models/category.dart';

class CategoryOperation{
  CategoryOperation._();
 static List<Category> getCategories(){
    return <Category> [
      Category('Top Songs', 'assets/image/demo1.jpg'),
      Category('Liked Songs', 'assets/image/demo2.jpg'),
      Category('Trending', 'assets/image/demo3.jpg'),
      Category('Top Hits', 'assets/image/demo4.jpg'),
      Category('Leo Das', 'assets/image/demo5.jpg'),
      Category('LCU Songs', 'assets/image/demo.jpg'),
      
    ];
  }
}