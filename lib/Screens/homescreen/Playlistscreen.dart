import 'package:flutter/material.dart';

import '../basicScreen/ProfileScreen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int name1 =1;
     Widget ListBlock2() => Container(
        width: 200,
        height: 200,
        

      );
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 28, 26, 26),
            child: AppBar(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                title: const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Your Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 115, 255, 0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 251, 251, 251),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Playlists",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 72),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Artists",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 72),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                  ),
                   Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    "Albums",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 72),
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.sort,color: Colors.white,)),
                  ),
                  Text("Recently Played",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                ],
              ),
              Container(
            height: 400,
            width: 400,
            color: Color.fromARGB(255, 26, 25, 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.separated(
                itemCount: 25,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                
                itemBuilder: (context, index) => Text("HEllo ${index}",style: TextStyle( color: Colors.white,fontSize: 20),),
                
                scrollDirection: Axis.vertical,
                
              
               
                
              ),
            ),

          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(top :12, right: 12),
            child: FloatingActionButton(onPressed: (){}
            ,child: Icon(Icons.queue_music_sharp,color: Color.fromARGB(255, 44, 44, 44),),backgroundColor: Color.fromARGB(255, 46, 255, 5),elevation: 0,),
          )
            ],
          ),
        ));
  }
}
