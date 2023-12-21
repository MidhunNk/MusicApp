import 'package:flutter/material.dart';

class CreatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        title: const Text('Creators',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Meet the Creators',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildCreatorCard(
                  name: 'Midhun NK',
                  description:
                      'Midhun is a passionate computer science engineering student with a keen interest in mobile app development. He loves exploring new technologies and solving real-world problems.',
                  photoUrl:
                      'assets/image/mike.jpeg', // Replace with actual photo URL
                ),
                const SizedBox(height: 20),
                _buildCreatorCard(
                  name: 'Asim Jasim',
                  description:
                      'Asim is an enthusiastic CSE student who enjoys working on innovative projects. He has a strong foundation in software development and is always eager to learn new skills.',
                  photoUrl:
                      'assets/image/WhatsApp Image 2023-12-20 at 13.23.42_b5147daf.jpg', // Replace with actual photo URL
                ),
                const SizedBox(height: 20),
                _buildCreatorCard(
                  name: 'Aswaj C',
                  description:
                      'Aswaj is a dedicated computer science engineering student specializing in app development. He has a creative mindset and enjoys collaborating on projects that make a positive impact.',
                  photoUrl:
                      'assets/image/aswaj2.jpg', // Replace with actual photo URL
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreatorCard(
      {required String name,
      required String description,
      required String photoUrl}) {
    return Card(
      elevation: 4,
      color: const Color.fromARGB(255, 92, 91, 91),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(photoUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
