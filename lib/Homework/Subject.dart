import 'package:flutter/material.dart';

class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    const List<String> pages = [
      'Home',
      'Profile',
      'Settings',
      'Logout',
    ];

    final List<String> buttonLabels = [
      'Science',
      'Mathematics',
      'Social Studies',
      'Sci. Chemistry',
      'Computer',
      'Accountancy',
      'English',
    ];

    final List<String> buttonImages = [
      'assets/Science.png',
      'assets/Math.png',
      'assets/Social.png',
      'assets/scienceChem.png',
      'assets/Computer.png',
      'assets/Account.png',
      'assets/Eng.png',
    ];

    final List<Color> internalBorderColors = [
      Colors.purple[100]!,
      Colors.blue[400]!,
      Colors.orange[300]!,
      Colors.blue[200]!,
      Colors.blue,
      Colors.purple[400]!,
      Colors.pink[300]!,
    ];

    final List<Function> buttonActions = [
      () => print('Math pressed'),
      () => print('Science pressed'),
      () => print('History pressed'),
      () => print('Geography pressed'),
      () => print('English pressed'),
      () => print('Art pressed'),
      () => print('Music pressed'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject List'),
        // backgroundColor: blueColor,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: blueColor),
              //dropdownColor: blueColor,
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
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () => buttonActions[index](),
              style: ElevatedButton.styleFrom(
                foregroundColor: blueColor, backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.all(20.0),
                shadowColor: Colors.grey[400], // External shadow color
                elevation: 5.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: internalBorderColors[index],
                        width: 2.0,
                      ),
                    ),
                    child: Image.asset(
                      buttonImages[index],
                      height: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    buttonLabels[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
