import 'package:flutter/material.dart';
import 'package:office/Files/ParentsInfo.dart';

class ParentProfile extends StatefulWidget {
  @override
  _ParentProfileState createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  final Map<String, Map<String, String>> parents = {
    'father': {
      'name': 'Joe Sheren',
      'phonenumber': '985185255',
      'occupation': 'Businesss Man',
      'address': 'Dhobighat-04, Jhamsikhel',
    },
    'mother': {
      'name': 'Emily Sheren',
      'phonenumber': '985185255',
      'occupation': 'Business Woman',
      'address': 'Dhobighat-04, Jhamsikhel',
    },
    'guardian': {
      'name': 'Helen Swigger',
      'relation': 'Aunt',
      'phonenumber': '985185255',
      'occupation': 'Teacher',
      'address': 'Dhobighat-04, Jhamsikhel',
    },
  };

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Scaffold(
      body: ParentInfo(
        fathername: parents['father']!['name']!,
        fatherPhonenumber: parents['father']!['phonenumber']!,
        fatherOccupation: parents['father']!['occupation']!,
        fatherAddress: parents['father']!['address']!,
        mothername: parents['mother']!['name']!,
        motherPhonenumber: parents['mother']!['phonenumber']!,
        motherOccupation: parents['mother']!['occupation']!,
        motherAddress: parents['mother']!['address']!,
        guardianName: parents['guardian']!['name']!,
        guardianRelation: parents['guardian']!['relation']!,
        guardianPhonenumber: parents['guardian']!['phonenumber']!,
        guardianOccupation: parents['guardian']!['occupation']!,
        guardianAddress: parents['guardian']!['address']!,
      ),
    );
  }
}
