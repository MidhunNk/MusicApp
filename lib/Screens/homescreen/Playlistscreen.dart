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
        child: Image.asset("assets/image/demo3.jpg"),

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
                          color: Color.fromARGB(255, 201, 255, 216),
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
                          color: Color.fromARGB(255, 201, 255, 216),
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
                      color: Color.fromARGB(255, 201, 255, 216),
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
            height: 1000,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                
                itemBuilder: (context, index) => Text("HEllo ${index}",style: TextStyle( color: Colors.white,fontSize: 20),),
                
                scrollDirection: Axis.vertical,
                
              
               
                
              ),
            ),

          ),
            ],
          ),
        ));
  }
}
