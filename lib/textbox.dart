import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;

  const MyTextBox({super.key,required this.text,required this.sectionName});
  

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(color:const Color.fromARGB(255, 136, 129, 129),
      borderRadius: BorderRadius.circular(8)),
      
      padding:const EdgeInsets.only(left: 20,bottom: 20),
      margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sectionName,
            style: const TextStyle(color: Color.fromARGB(255, 68, 65, 65)),),
            IconButton(onPressed: () {}, icon:const Icon(Icons.edit)),
          ],
        ),

        
        Text(text,style:const TextStyle(fontWeight: FontWeight.bold),),
        
      ],

      ),
    );
  }
}