import 'package:flutter/material.dart';

class ParentInfo extends StatelessWidget {
  final String fathername;
  final String fatherPhonenumber;
  final String fatherOccupation;
  final String fatherAddress;
  final String mothername;
  final String motherPhonenumber;
  final String motherOccupation;
  final String motherAddress;
  final String guardianName;
  final String guardianRelation;
  final String guardianPhonenumber;
  final String guardianOccupation;
  final String guardianAddress;

  const ParentInfo({
    Key? key,
    required this.fathername,
    required this.fatherPhonenumber,
    required this.fatherOccupation,
    required this.fatherAddress,
    required this.mothername,
    required this.motherPhonenumber,
    required this.motherOccupation,
    required this.motherAddress,
    required this.guardianName,
    required this.guardianRelation,
    required this.guardianPhonenumber,
    required this.guardianOccupation,
    required this.guardianAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/Young.png'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$mothername',
              style: TextStyle(
                color: blueColor,
                fontSize: 18,
              ),
            ),
            Text(
              'Mother',
              style: TextStyle(
                color: blueColor,
                fontSize: 12,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Parent's/Guardian Info",
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  // color: blueColor,
                ),
              ),
              SizedBox(height: 20),
              buildInfoRowRightAligned(
                  'assets/father.png', "Father's Name", fathername),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    buildInfoRowRightAligned(
                        'assets/phone.png', 'Phone Number', fatherPhonenumber),
                    buildInfoRowRightAligned('assets/occupation.png',
                        'Occupation', fatherOccupation),
                    buildInfoRowRightAligned(
                        'assets/address.png', 'Address', fatherAddress),
                  ],
                ),
              ),
              SizedBox(width: 20),
              // SizedBox(height: 16),
              buildInfoRowRightAligned(
                  'assets/mother.png', "Mother's Name", mothername),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    buildInfoRowRightAligned(
                        'assets/phone.png', 'Phone Number', motherPhonenumber),
                    buildInfoRowRightAligned('assets/occupation.png',
                        'Occupation', motherOccupation),
                    buildInfoRowRightAligned(
                        'assets/address.png', 'Address', motherAddress),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildInfoRowRightAligned(
                  'assets/guardian.png', "Guardian's Name", guardianName),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    buildInfoRowRightAligned('assets/relationship.png',
                        'Relation', guardianRelation),
                    buildInfoRowRightAligned('assets/phone.png', 'Phone Number',
                        guardianPhonenumber),
                    buildInfoRowRightAligned('assets/occupation.png',
                        'Occupation', guardianOccupation),
                    buildInfoRowRightAligned(
                        'assets/address.png', 'Address', guardianAddress),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRowRightAligned(String iconPath, String title, String value) {
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
              SizedBox(width: 10),
              Text(
                '$title: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
