import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _selectedStar = 0; // Variable to track the selected star
  TextEditingController _feedbackController = TextEditingController();
  List<String> improvementOptions = [
    'Service speed',
    'Communication',
    'Product quality',
    'Website usability',
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 15, 15),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Heading
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Rate Your Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),

            // Prompt
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 16, top: 5),
              child: Text(
                'Are you satisfied with the service?',
                style: TextStyle(
                  color: Color.fromARGB(255, 208, 206, 206),
                  fontSize: 14.0,
                ),
              ),
            ),

            // Stars for feedback
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Row(
                children: List.generate(5, (index) {
                  return Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        index < _selectedStar
                            ? Icons.star
                            : Icons.star_border,
                        color: index < _selectedStar
                            ? Colors.yellow
                            : Colors.white,
                        size: 40.0,
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedStar = index + 1;
                        });
                      },
                    ),
                  );
                }),
              ),
            ),

            // Line across the screen
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 16),
              height: 1,
              color: Colors.white,
            ),

            // "Tell us what can be improved" text
            const Padding(
              padding:  EdgeInsets.only(left: 16, top: 20,bottom: 10),
              child: Text(
                'Tell us what can be improved',
                style: TextStyle(
                  color: Color.fromARGB(255, 199, 198, 198),
                  fontSize: 16.0,
                ),
              ),
            ),

            // Improvement options as text boxes
            Wrap(
              spacing: 8.0,
              children: improvementOptions
                  .map(
                    (option) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _feedbackController.text = option;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 61, 61, 61),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              option,
                              style:const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            // Text box for additional feedback
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 15,top: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 61, 61, 61),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _feedbackController,
                    maxLines: 3, // Limit the number of lines
                    style:const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    decoration:const InputDecoration(
                      hintText: 'Additional feedback...',
                     hintStyle: TextStyle(color:  Color.fromARGB(255, 214, 214, 214)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            // Submit button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                },
                child:const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}