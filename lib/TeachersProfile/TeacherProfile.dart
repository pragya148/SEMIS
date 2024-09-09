import 'package:flutter/material.dart';
import 'package:office/TeachersProfile/TeacherInfo.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> teachers = [
    {
      'name': 'Abhilash Arya',
      'dob': '2056/02/14',
      'gender': 'Male',
      'bloodGroup': 'O +ve',
      'experience': '8 years',
      'expertise': 'Mathematics',
      'phoneNumber': '9866545790',
      'address': 'Dhobighat -04, '
          'Jhamsikhel',
      'joinedDate': '8 June 2023',
      'photo': 'assets/Abhilish.png',
    },
    // Add more teachers if necessary
  ];

  String _selectedTeacher = 'Abhilash Arya'; // Initial selected teacher

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(teachers.first['photo']),
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.arrow_drop_down, color: blueColor),
            offset: const Offset(0, 56),
            itemBuilder: (context) => teachers.map((teacher) {
              return PopupMenuItem<String>(
                value: teacher['name'],
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(teacher['photo']),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(teacher['name'],
                          style: const TextStyle(color: blueColor)),
                    ),
                    _selectedTeacher == teacher['name']
                        ? const CircleAvatar(
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
              );
            }).toList(),
            onSelected: (String newValue) {
              setState(() {
                _selectedTeacher = newValue;
              });

              final selectedTeacher = teachers.firstWhere(
                (teacher) => teacher['name'] == newValue,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeacherInfo(
                    name: selectedTeacher['name'],
                    dob: selectedTeacher['dob'],
                    gender: selectedTeacher['gender'],
                    bloodGroup: selectedTeacher['bloodGroup'],
                    experience: selectedTeacher['experience'],
                    expertise: selectedTeacher['expertise'],
                    phoneNumber: selectedTeacher['phoneNumber'],
                    address: selectedTeacher['address'],
                    joinedDate: selectedTeacher['joinedDate'],
                    photo: selectedTeacher['photo'], // Corrected to 'image'
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: TeacherInfo(
        name: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['name'],
        dob: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['dob'],
        gender: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['gender'],
        bloodGroup: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['bloodGroup'],
        experience: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['experience'],
        expertise: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['expertise'],
        phoneNumber: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['phoneNumber'],
        address: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['address'],
        joinedDate: teachers.firstWhere(
            (teacher) => teacher['name'] == _selectedTeacher)['joinedDate'],
        photo: teachers
                .firstWhere((teacher) => teacher['name'] == _selectedTeacher)[
            'photo'], // Corrected to 'photo'
      ),
    );
  }
}
