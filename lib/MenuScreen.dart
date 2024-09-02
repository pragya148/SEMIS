import 'package:flutter/material.dart';
import 'package:office/Files/ApplyLeave.dart';
import 'package:office/Files/Attendance.dart';
import 'package:office/Files/ParentProfile.dart';
import 'package:office/Files/Profile.dart';
import 'package:office/Files/Subject.dart';
import 'package:office/Files/Teacher.dart';
import 'package:office/HeadDrawer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              MyHeadDrawer(),
              Divider(
                  indent: 20, endIndent: 20, color: blueColor, thickness: 1),
              MyDrawerList(context, blueColor),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MyDrawerList(BuildContext context, Color blueColor) {
  return Container(
    child: Column(
      children: [
        ListTile(
          leading: Image.asset(
            'assets/routine.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Class Routine', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Class Routine
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/subjects.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Subjects List', style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubjectList()),
            );
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/Teacher.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title:
              Text('Subjects Teacher', style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Teacher()),
            );
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/chat1.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Chat', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/result.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Result', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/library.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Library', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/eLibrary.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('e- Library', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/profile.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title:
              Text("Children's Profile", style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/parents.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title:
              Text("Parent's Profile", style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ParentProfile()),
            );
            // Perform activity for Subjects List
          },
        ),

        ListTile(
          leading: Image.asset(
            'assets/Attendance1.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Attendance', style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Attendance()),
            );
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/ApplyLeave.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Apply Leave', style: TextStyle(color: Colors.black)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ApplyLeave()),
            );
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/event.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Events', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/NoticeIcon.png', // Replace with your icon image asset path
            color: blueColor,
            width: 24, // Set the desired width
            height: 24, // Set the desired height
          ),
          title: Text('Notice Board', style: TextStyle(color: Colors.black)),
          onTap: () {
            // Perform activity for Subjects List
          },
        ),
        // Add more ListTiles with Image.asset for other menu items
      ],
    ),
  );
}
