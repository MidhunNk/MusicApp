
import 'package:music_app/models/musiclist2.dart';

class MusicOperation2 {
  MusicOperation2._();
  static List<MusicList2> getMusic(){
    return <MusicList2>[MusicList2('Billie Eilish','assets/image/demo1.jpg','"Toofan" is a song from KGF Chapter 2'),
    MusicList2('Ariana Grande','assets/image/demo2.jpg','"Bang Bang" is a song from MyEverything'),
    MusicList2('Day Light','assets/image/demo3.jpg','"Daylight" is a song by David Kushner'),
    MusicList2('Summertimes','assets/image/demo4.jpg','"Summertimes" is a song by Lana Del Rey')];
    
  }
}