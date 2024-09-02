import 'package:flutter/material.dart';
import 'package:office/Files/ApplyLeave.dart';

class LeaveListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> leaveData = [
    {
      'month': 'September',
      'leaves': [
        {
          'title': 'Half Day Application',
          'date': '12-09-2023',
          'reason': 'Personal Leave',
          'status': 'pending'
        },
        {
          'title': 'Full Day Application',
          'date': '01-09-2023',
          'reason': 'Personal Leave',
          'status': 'approved'
        },
      ],
    },
    {
      'month': 'August',
      'leaves': [
        {
          'title': 'Multiple Day Application',
          'date': '10-8-2023' ' to ' '20-8-2023',
          'reason': 'Sick Leave',
          'status': 'rejected'
        },
        {
          'title': 'Full Day Application',
          'date': '16-08-2023',
          'reason': 'Personal Leave',
          'status': 'approved'
        },
      ],
    },
    {
      'month': 'July',
      'leaves': [
        {
          'title': 'Full Day Application',
          'date': '10-7-2023',
          'reason': 'Personal Leave',
          'status': 'approved'
        },
      ],
    },
    {
      'month': 'May',
      'leaves': [
        {
          'title': 'Full Day Application',
          'date': '10-5-2023',
          'reason': 'Personal Leave',
          'status': 'approved'
        },
      ],
    },
    // Add more months and leaves as needed
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: leaveData.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leaveData[index]['month'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ...leaveData[index]['leaves'].map<Widget>((leave) {
                  Color statusColor;
                  String? iconPath;
                  Function()? onIconPressed;

                  switch (leave['status']) {
                    case 'pending':
                      statusColor = Colors.orange;
                      iconPath =
                          'assets/ApplyLeave.png'; // Replace with your image path
                      onIconPressed = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApplyLeave(),
                          ),
                        );
                      };
                      break;
                    case 'approved':
                      statusColor = Colors.green;
                      break;
                    case 'rejected':
                      statusColor = Colors.red;
                      break;
                    default:
                      statusColor = Colors.grey;
                  }

                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.grey,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      height: 100, // Set a fixed height for the ListTile
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(leave['title']),
                            Text(leave['date']),
                            Text(
                              leave['reason'],
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (iconPath != null)
                              IconButton(
                                icon: Image.asset(iconPath),
                                onPressed: onIconPressed,
                                //  iconSize: 10,
                              ),
                            Spacer(), // Spacer to push the status to the bottom
                            Text(
                              leave['status'].toUpperCase(),
                              style: TextStyle(color: statusColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
