import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  String? selectedgrade;
  static const Color blueColor = Color(0xFF0B2457);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Colors.grey;
  static const Color lightBlueColor =
      Color(0xFFD6EAF8); // Light blue for remarks
  List<String> students = ['Student 1', 'Student 2', 'Student 3'];
  int currentIndex = 0;
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> grade = ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D', 'E'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Studies'),
        backgroundColor: whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assignment title and due date ListTile with padding
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                title: const Text(
                  'Essay on Labour Day',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text(
                  'Due Date: May 05, 2023',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),

            // Student Name with arrows inside smaller, styled containers
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left arrow
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_left,
                          color: currentIndex == 0 ? greyColor : blueColor,
                        ),
                        onPressed: currentIndex == 0
                            ? null
                            : () {
                                setState(() {
                                  if (currentIndex > 0) {
                                    currentIndex--;
                                  }
                                });
                              },
                      ),
                    ),
                  ),

                  // Student name
                  Text(
                    students[currentIndex],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  // Right arrow
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_right,
                          color: currentIndex == students.length - 1
                              ? greyColor
                              : blueColor,
                        ),
                        onPressed: currentIndex == students.length - 1
                            ? null
                            : () {
                                setState(() {
                                  if (currentIndex < students.length - 1) {
                                    currentIndex++;
                                  }
                                });
                              },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Submission date
            const Center(
              heightFactor: 0.05,
              child: Text(
                'Submitted: Sep 12, 2024',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 10), // Space between sections

            // Homework box with dotted border
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Homework',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                height: 100, // Decreased height of the homework box
                decoration: BoxDecoration(
                  border: Border.all(
                    //  color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Text(
                    'Homework submitted here',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Remarks description box with new style
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Remarks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(8.0),
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 162, 210, 243),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  maxLines: 4,
                  style: TextStyle(color: greyColor),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter remarks',
                    hintStyle: TextStyle(color: greyColor),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Grade box smaller horizontally
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Grade/Marks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 100, // Increased the width to prevent overflow
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText:
                        'Select Grade', // Modified label to be more descriptive
                    border: OutlineInputBorder(),
                  ),
                  value: selectedgrade,
                  items: grade
                      .map((grade) => DropdownMenuItem(
                            value: grade,
                            child: Text(grade),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedgrade = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Check button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle leave application submission
                },
                child: const Text('Check'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: whiteColor,
                  backgroundColor: blueColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
