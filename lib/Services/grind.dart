
import 'package:music_app/models/grindclass.dart';

class Grindoperation{
  Grindoperation._();

 static List<Grindclass> getGrind(){
    return <Grindclass> [
      Grindclass('Best Songs', 'assets/image/bestsongs.jpg'),
      Grindclass('Liked Songs', 'assets/image/demo2.jpg'),
      Grindclass('Trending', 'assets/image/demo3.jpg'),
      Grindclass('Top Hits', 'assets/image/demo4.jpg'),
      Grindclass('Playlist', 'assets/image/demo7.jpeg'),
      Grindclass('LCU Songs', 'assets/image/demo.jpg'),
      
    ];
  }
}