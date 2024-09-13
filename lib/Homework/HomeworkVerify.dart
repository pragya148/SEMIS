import 'package:flutter/material.dart';
import 'package:office/Homework/CheckedData.dart';
import 'package:office/Homework/NotSubmittedData.dart';
import 'package:office/Homework/SubmittedData.dart';
import 'package:office/Homework/AddWork.dart'; // Import your AddWork page

class HomeworkVerify extends StatefulWidget {
  const HomeworkVerify({Key? key}) : super(key: key);

  @override
  _HomeworkVerifyState createState() => _HomeworkVerifyState();
}

class _HomeworkVerifyState extends State<HomeworkVerify> {
  // Selected button index (0 = Submitted, 1 = Checked, 2 = Not Submitted)
  int selectedIndex = 0;

  // Define colors
  static const Color blueColor = Color(0xFF0B2457);
  static const Color whiteColor = Colors.white;
  static const Color lightblue = Color.fromARGB(255, 210, 208, 234);

  // Pages to navigate to
  final List<Widget> pages = [
    const SubmittedPage(),
    const CheckedPage(),
    const NotSubmittedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Verification'),
        // backgroundColor: blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Subtitle inside a ListTile
            ListTile(
              title: const Text(
                'Essay On Labour Day',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Due: Sep 12, 2024',
                    style: TextStyle(fontSize: 16, color: lightblue),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '5/20 Submitted',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(221, 248, 55, 29)),
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Checked: 7/10',
                    style: const TextStyle(
                      color: Colors.green, // Green text for checked count
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Row of buttons (Submitted, Checked, Not Submitted)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Submitted Button
                buildButton('Submitted By', 0),
                // Checked Button
                buildButton('Checked', 1),
                // Not Submitted Button
                buildButton('Not Submitted', 2),
              ],
            ),
            const SizedBox(height: 20),
            // Show the selected page content
            Expanded(
              child: pages[selectedIndex],
            ),
          ],
        ),
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddWork()),
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
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 6,
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

  // Function to build each button
  Widget buildButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? blueColor
              : lightblue, // Background color
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                selectedIndex == index ? whiteColor : blueColor, // Text color
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Page 1: Submitted Page
class SubmittedPage extends StatelessWidget {
  const SubmittedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubmittedData();
  }
}

// Page 2: Checked Page
class CheckedPage extends StatelessWidget {
  const CheckedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CheckedData();
  }
}

// Page 3: Not Submitted Page
class NotSubmittedPage extends StatelessWidget {
  const NotSubmittedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotSubmittedData();
  }
}
