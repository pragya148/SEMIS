import 'package:flutter/material.dart';

class HomeWorkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const List<String> pages = [
      'Home',
      'Profile',
      'Settings',
      'Logout',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Homework',
          style: TextStyle(color: blueColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          padding:
              const EdgeInsets.only(top: 2.0, bottom: 2, left: 9, right: 9),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Homework List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/Filter.png', // Replace with your icon image asset
                      width: 60,
                      height: 60,
                    ),
                    onPressed: () {
                      // Define what happens when the icon is pressed
                    },
                  ),
                ],
              ),
              //   SizedBox(height: 5.0),
              Expanded(
                child: ListView(
                  children: [
                    _buildHomeworkTile('Social Studies', 'Room No: 011155',
                        'assets/SocialStd.png', 3, context),
                    _buildHomeworkTile('Mathematics', 'Room No: 011155',
                        'assets/Mathematics.png', 2, context),
                    _buildHomeworkTile('Mathematics', 'Room No: 011155',
                        'assets/Mathematics.png', 2, context),
                    _buildHomeworkTile('Mathematics', 'Room No: 011155',
                        'assets/Mathematics.png', 2, context),
                    _buildHomeworkTile('Computer Science', 'Room No: 011155',
                        'assets/ComputerSub.png', 4, context),
                    _buildHomeworkTile('English', 'Room No: 011155',
                        'assets/English.png', 4, context),
                    _buildHomeworkTile('Nepali', 'Room No: 011155',
                        'assets/Nepali.png', 4, context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHomeWork()),
          );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 10.0,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 6,
                //  blurRadius: 7,
                // offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/addWork.png',
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeworkTile(String subject, String dueDate, String imagePath,
      int homeworkCount, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.withOpacity(0.5),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () {
          // Handle the onTap event if needed
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          leading: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          title: Text(
            subject,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            dueDate,
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange,
            ),
          ),
          trailing: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Text(
              '$homeworkCount',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddHomeWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Homework'),
      ),
      body: Center(
        child: Text('Add Homework Page'),
      ),
    );
  }
}
