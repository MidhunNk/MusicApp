
import 'package:music_app/models/grindclass.dart';

class Grindoperation{
  Grindoperation._();

 static List<Grindclass> getGrind(){
    return <Grindclass> [
      Grindclass('Top Songs', 'assets/image/demo1.jpg'),
      Grindclass('Liked Songs', 'assets/image/demo2.jpg'),
      Grindclass('Trending', 'assets/image/demo3.jpg'),
      Grindclass('Top Hits', 'assets/image/demo4.jpg'),
      Grindclass('Leo Das', 'assets/image/demo5.jpg'),
      Grindclass('LCU Songs', 'assets/image/demo.jpg'),
      
    ];
  }
}