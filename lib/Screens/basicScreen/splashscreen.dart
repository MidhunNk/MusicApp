import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children:[  
           Padding(
                padding: const EdgeInsets.only(top: 300, left: 5),
                child: Container(
                        width:  90,
                        height: 90,
                        decoration: BoxDecoration(
                          
                            image: const DecorationImage(
                              opacity: 0.5,
                                image: AssetImage('assets/image/demo6.jpg',),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20)),
                            
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 5),
                child: Container(
                  
                  child: const Text(
                    'Music',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 32, 32),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ),
        
        ]),
      ),
    );
  }
}