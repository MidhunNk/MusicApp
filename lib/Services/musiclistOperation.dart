import 'package:music_app/models/musiclist.dart';

class MusicOperation {
  MusicOperation._();
  static List<MusicList> getMusic(){
    return <MusicList>[MusicList('Toofan','assets/image/demolist.jpg','"Toofan" is a song from KGF Chapter 2'),
    MusicList('Sulthan','assets/image/demolist2.jpg','"Sulthan" is a song from KGF Chapter 2'),
    MusicList('Mehabuba','assets/image/demolist3.jpg','"Mehabuba" is a song from KGF Chapter 2'),
    MusicList('Salam Rocky','assets/image/demolist4.jpg','"Salam" is a song from KGF Chapter 2')];
    
  }
}