import 'package:flutter/material.dart';
import 'StudentInfo.dart'; // Ensure correct import for your project structure

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> students = [
    {
      'name': 'Emma Sheren',
      'classInfo': 'VI',
      'dob': '2056/02/14',
      'gender': 'Female',
      'bloodGroup': 'O +ve',
      'galleryImages': [
        'assets/gallery_image_0.png',
        'assets/gallery_image_1.png',
        'assets/gallery_image_2.png',
        'assets/gallery_image_3.png',
      ],
      'image': 'assets/Young.png'
    },
    {
      'name': 'Sheldon Sheren',
      'classInfo': 'VII',
      'dob': '2056/02/14',
      'gender': 'Male',
      'bloodGroup': 'A +ve',
      'galleryImages': [
        'assets/gallery_image_0.png',
        'assets/gallery_image_1.png',
        'assets/gallery_image_2.png',
        'assets/gallery_image_3.png',
      ],
      'image': 'assets/Young.png'
    },
  ];

  String _selectedStudent = 'Emma Sheren'; // Initial selected student

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/Young.png'),
            ),
          ),
          SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down, color: blueColor),
            offset:
                Offset(0, 56), // Offset to position the menu below the AppBar
            itemBuilder: (context) => students.map((student) {
              return PopupMenuItem<String>(
                value: student['name'],
                child: SizedBox(
                  width: 200, // Increase the width of the dropdown item
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(student['image']),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(student['name'],
                            style: TextStyle(color: blueColor)),
                      ),
                      _selectedStudent == student['name']
                          ? CircleAvatar(
                              backgroundColor: blueColor,
                              radius: 12,
                              child: Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 12,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: blueColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              );
            }).toList(),
            onSelected: (String newValue) {
              // Update the selected student and navigate to the corresponding page
              setState(() {
                _selectedStudent = newValue;
              });

              final selectedStudent = students.firstWhere(
                (student) => student['name'] == newValue,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentInfo(
                    name: selectedStudent['name'],
                    classInfo: selectedStudent['classInfo'],
                    dob: selectedStudent['dob'],
                    gender: selectedStudent['gender'],
                    bloodGroup: selectedStudent['bloodGroup'],
                    galleryImages:
                        List<String>.from(selectedStudent['galleryImages']),
                    image: selectedStudent['image'],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: StudentInfo(
        name: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['name'],
        classInfo: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['classInfo'],
        dob: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['dob'],
        gender: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['gender'],
        bloodGroup: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['bloodGroup'],
        galleryImages: List<String>.from(students.firstWhere(
            (student) => student['name'] == _selectedStudent)['galleryImages']),
        image: students.firstWhere(
            (student) => student['name'] == _selectedStudent)['image'],
      ),
    );
  }
}
