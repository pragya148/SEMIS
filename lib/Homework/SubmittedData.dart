import 'package:flutter/material.dart';
import 'assignment.dart'; // Import the Assignment page

class SubmittedData extends StatelessWidget {
  const SubmittedData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final students = [
      {
        'name': 'Ruchie Rayal',
        'rollNo': '001',
        'date': 'May 02, 2023',
        'time': '11:56 AM'
      },
      {
        'name': 'Emma Sheren',
        'rollNo': '005',
        'date': 'May 02, 2023',
        'time': '02:56 AM'
      },
      // Add more students as needed
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AssignmentPage()), // Navigate to Assignment Page
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                //  border: Border.all(color: Color(0xFF0B2457)), // Border color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student['name']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Roll No: ${student['rollNo']}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        student['date']!,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 240, 100, 90)),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        student['time']!,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 240, 100, 90)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
