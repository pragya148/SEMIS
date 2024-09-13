import 'package:flutter/material.dart';

class Notify extends StatelessWidget {
  final List<Map<String, dynamic>> notificationsByDate = [
    {
      'date': 'Today',
      'notifications': [
        {
          'title': 'Notification 1',
          'subtitle': 'Subtitle for Notification 1',
          'time': '10:00 AM'
        },
        {
          'title': 'Notification 2',
          'subtitle': 'Subtitle for Notification 2',
          'time': '11:30 AM'
        },
        {
          'title': 'Notification 3',
          'subtitle': 'Subtitle for Notification 3',
          'time': '1:45 PM'
        },
      ],
    },
    {
      'date': 'Yesterday',
      'notifications': [
        {
          'title': 'Notification 1',
          'subtitle': 'Subtitle for Notification 1',
          'time': '9:15 AM'
        },
        {
          'title': 'Notification 2',
          'subtitle': 'Subtitle for Notification 2',
          'time': '12:00 PM'
        },
      ],
    },
    {
      'date': 'Sep 10, 2024',
      'notifications': [
        {
          'title': 'Notification 1',
          'subtitle': 'Subtitle for Notification 1',
          'time': '8:00 AM'
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notificationsByDate.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  notificationsByDate[index]['date'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: notificationsByDate[index]['notifications']
                        .map<Widget>((notification) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: blueColor,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification['title'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: blueColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      notification['subtitle'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: const Color.fromARGB(
                                            255, 91, 90, 90),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                notification['time'],
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 146, 23, 14),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Notify(),
  ));
}
