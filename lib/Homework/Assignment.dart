import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  List<String> students = ['Student 1', 'Student 2', 'Student 3'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assignment title and due date ListTile with padding
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  'Assignment Title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  'Due Date: Sep 15, 2024',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),

            // Student Name with arrows
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      setState(() {
                        if (currentIndex > 0) {
                          currentIndex--;
                        }
                      });
                    },
                  ),
                  Text(
                    students[currentIndex],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      setState(() {
                        if (currentIndex < students.length - 1) {
                          currentIndex++;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),

            // Submission date
            Center(
              child: Text(
                'Submitted: Sep 12, 2024',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 16), // Space between sections

            // Homework box with dotted border
            Text(
              'Homework',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Homework submitted here',
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Remarks description box
            Text(
              'Remarks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(8.0),
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                maxLines: 4,
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter remarks'),
              ),
            ),

            const SizedBox(height: 16),

            // Grade box
            Text(
              'Grade',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(8.0),
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Enter grade'),
              ),
            ),

            const SizedBox(height: 16),

            // Check button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle check action
                },
                child: Text('Check'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
