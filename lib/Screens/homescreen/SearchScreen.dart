import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    
    Widget ListBlock4() => Container(
          width: 200,
          height: 200,
          child: Image.asset("assets/image/demo4.jpg"),
        );
 Widget GrindBlock() => Container(
          width: 50,
          height: 50,
          child: Image.asset("assets/image/demo5.jpg",fit: BoxFit.fill,),
        );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Search',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const TextField(
                      decoration: InputDecoration(
                    hintText: "Search for Artists, Songs, Albums",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 57, 57, 57),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )),
                ),
              ),
            ),
            SizedBox(height: 15,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Picked For You",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Browse All",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 1,),
            Container(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListView.separated(
                  itemCount: 6,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => ListBlock4(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Grid View",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10,),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 6,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GrindBlock(),
            ),
          ],
        ),
      ),
    );
  }
}
