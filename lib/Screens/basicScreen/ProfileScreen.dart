import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Name');
    bioController = TextEditingController(text: 'Bio');
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 15, 15),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child:  Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),                 
                  Text(
                    'aswajpunda@mail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            const Text(
              'Aswaj:',
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            if (isEditing)
              TextFormField(
                controller: nameController,
                style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 175, 170, 170),),
              )
            else
              Text(
                nameController.text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 20),
            const Text(
              'Njan oru punda:',
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            if (isEditing)
              TextFormField(
                controller: bioController,
                style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 175, 170, 170),),
              )
            else
              Text(
                bioController.text,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: toggleEditMode,
              child: Padding(
                padding: const EdgeInsets.only(left: 140,right: 140,),
                child: Container(
                  color: Colors.grey,
                  child:const Center(
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child:  Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
          ],
          
        ),
        
      ),
      
    );
  }
}
