import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Today',
      'notifications': [
        {'message': 'New assignment uploaded.', 'time': '1 hour ago'},
        {'message': 'Meeting with principal at 3 PM.', 'time': '3 hours ago'},
      ],
    },
    {
      'title': 'Yesterday',
      'notifications': [
        {'message': 'Homework submission reminder.', 'time': '10:30 AM'},
        {'message': 'Sports event tomorrow.', 'time': '6:00 PM'},
      ],
    },
    {
      'title': 'Sep 01, 2024',
      'notifications': [
        {'message': 'Parent-teacher meeting.', 'time': '9:00 AM'},
        {'message': 'Annual day announcement.', 'time': '4:30 PM'},
      ],
    },
  ];
  Color blueColor = Color(0xFF0B2457);
  Color whiteColor = Colors.white;

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        //   backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  notifications[index]['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Column(
                children: List.generate(
                  notifications[index]['notifications'].length,
                  (i) => ListTile(
                    title: Text(
                        notifications[index]['notifications'][i]['message']),
                    leading: Image.asset(
                      'assets/notification.png', // Replace with your image path
                      width: 24,
                      height: 24,
                      color: blueColor, // Adjust the icon size as needed
                    ),
                    trailing: Text(
                      notifications[index]['notifications'][i]['time'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
