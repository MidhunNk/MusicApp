import 'package:flutter/material.dart';

class DataUsagePage extends StatefulWidget {
  @override
  _DataUsagePageState createState() => _DataUsagePageState();
}

class _DataUsagePageState extends State<DataUsagePage> {
  bool useMobileData = false;
  double dataUsed = 150.0; // Replace with actual data usage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:const Color.fromARGB(255, 17, 15, 15),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor:const Color.fromARGB(255, 33, 31, 31),
        title:const Text('Data Usage',style: TextStyle(color: Colors.white),),
         centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Allow Musify to use mobile data:',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
            Switch(
              value: useMobileData,
              onChanged: (value) {
                setState(() {
                  useMobileData = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Data used this month:',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                '$dataUsed MB',
                style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to reset data usage
                setState(() {
                  dataUsed = 0.0;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data usage reset.',style: TextStyle(color: Colors.white),),
                  ),
                );
              },
              child:const Text('Reset Data Usage',style: TextStyle(color: Color.fromARGB(255, 63, 158, 53)),),
            ),
          ],
        ),
      ),
    );
  }
}


