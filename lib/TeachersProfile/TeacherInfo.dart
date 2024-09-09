import 'package:flutter/material.dart';

class TeacherInfo extends StatelessWidget {
  final String name;
  final String dob;
  final String gender;
  final String bloodGroup;
  final String experience;
  final String expertise;
  final String phoneNumber;
  final String address;
  final String joinedDate;
  final String photo;

  const TeacherInfo({
    super.key,
    required this.name,
    required this.dob,
    required this.gender,
    required this.bloodGroup,
    required this.experience,
    required this.expertise,
    required this.phoneNumber,
    required this.address,
    required this.joinedDate,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457); // Define the blue color

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(photo),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: blueColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Image.asset('assets/ApplyLeave.png'),
                onPressed: () {},
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // White background for the container
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  buildInfoRowRightAligned(
                      'assets/Calendar.png', 'Date of Birth', dob, blueColor),
                  buildInfoRowRightAligned(
                      'assets/Gender.png', 'Gender', gender, blueColor),
                  buildInfoRowRightAligned('assets/BloodGroup.png',
                      'Blood Group', bloodGroup, blueColor),
                  buildInfoRowRightAligned('assets/Experience.png',
                      'Experience', experience, blueColor),
                  buildInfoRowRightAligned('assets/Expertise.png', 'Expertise',
                      expertise, blueColor),
                  buildInfoRowRightAligned('assets/Phone.png', 'Phone Number',
                      phoneNumber, blueColor),
                  buildInfoRowRightAligned(
                      'assets/Address.png', 'Address', address, blueColor),
                  buildInfoRowRightAligned('assets/Calendar.png', 'Joined Date',
                      joinedDate, blueColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRowRightAligned(
      String iconPath, String title, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 10),
              Text(
                '$title: ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor, // Text color set to blue
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: textColor, // Detail text color set to blue
            ),
          ),
        ],
      ),
    );
  }
}
