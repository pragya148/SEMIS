import 'package:flutter/material.dart';

class Teacher extends StatelessWidget {
  final List<Map<String, String>> teacherList = [
    {
      'name': 'Abhilish Arya',
      'subject': 'Science',
      'image': 'assets/Abhilish.png',
      'icon1': 'assets/Call.png',
      'icon2': 'assets/chat1.png',
    },
    {
      'name': 'Sarbin Maharjan',
      'subject': 'English',
      'image': 'assets/Sarbin.png',
      'icon1': 'assets/Call.png',
      'icon2': 'assets/chat1.png',
    },
    {
      'name': 'Kshinu Karmacharya',
      'subject': 'Science',
      'image': 'assets/Kshinu.png',
      'icon1': 'assets/Call.png',
      'icon2': 'assets/chat1.png',
    },
    {
      'name': 'Amila Acharya',
      'subject': 'Nepali',
      'image': 'assets/Amila.png',
      'icon1': 'assets/Call.png',
      'icon2': 'assets/chat1.png',
    },
    {
      'name': 'Rhitin Basnet',
      'subject': 'Science',
      'image': 'assets/Rhitin.png',
      'icon1': 'assets/Call.png',
      'icon2': 'assets/chat1.png',
    },
    // Add more teachers here
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color greyColor = Colors.grey;
    const List<String> pages = ['Home', 'Profile', 'Settings', 'Logout'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Teacher'),
        backgroundColor: Colors.white,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: blueColor),
              items: pages.map((String page) {
                return DropdownMenuItem<String>(
                  value: page,
                  child: Text(
                    page,
                    style: const TextStyle(color: blueColor),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle navigation to other pages
                print('Selected page: $newValue');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Young.png'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: teacherList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 2,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      teacherList[index]['image']!,
                      width: 60,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teacherList[index]['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(teacherList[index]['subject']!),
                      Row(
                        children: [
                          IconButton(
                            icon: Image.asset(teacherList[index]['icon1']!),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Image.asset(teacherList[index]['icon2']!),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
