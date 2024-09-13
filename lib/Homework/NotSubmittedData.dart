import 'package:flutter/material.dart';

class NotSubmittedData extends StatelessWidget {
  const NotSubmittedData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final students = [
      {
        'name': 'Ruchie Rayal',
        'rollNo': '001',
      },
      {
        'name': 'Emma Sheren',
        'rollNo': '005',
      },
      // Add more students as needed
    ];

    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(students.length, (index) {
            final student = students[index];
            return Column(
              children: [
                Container(
                  //    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
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
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (index <
                    students.length - 1) // Add divider except for the last item
                  const Divider(
                    color: Color.fromARGB(255, 196, 191, 191), // Divider color
                    thickness: 2, // Divider thickness
                    indent: 20, // Indent to shorten the length of the divider
                    endIndent:
                        20, // End indent to shorten the length of the divider
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
