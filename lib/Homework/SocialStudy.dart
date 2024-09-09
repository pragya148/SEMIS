import 'package:flutter/material.dart';

class SocialStudy extends StatefulWidget {
  const SocialStudy({super.key});

  @override
  _SocialStudyState createState() => _SocialStudyState();
}

class _SocialStudyState extends State<SocialStudy> {
  bool isAssignedExpanded = false;
  bool isCheckedExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Studies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ListView showing the list tile
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    leading: Image.asset(
                      'assets/SocialStd.png', // Replace with your image asset path
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    title: const Text(
                      'Social Studies',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Room No: 011155'),
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  // Additional list items can go here
                ],
              ),
            ),

            // Padding to separate ListView from the expandable sections
            // const SizedBox(height: 8.0),

            // "Assigned" button with dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ExpansionTile(
                title: const Text('Assigned'),
                trailing: const Icon(Icons.arrow_drop_down),
                children: const [
                  ListTile(
                    title: Text('Assignment 1'),
                  ),
                  ListTile(
                    title: Text('Assignment 2'),
                  ),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => isAssignedExpanded = expanded);
                },
              ),
            ),

            // Padding between the two sections
            const SizedBox(height: 8.0),

            // "Checked" button with dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ExpansionTile(
                title: const Text('Checked'),
                trailing: const Icon(Icons.arrow_drop_down),
                children: const [
                  ListTile(
                    title: Text('Checked Work 1'),
                  ),
                  ListTile(
                    title: Text('Checked Work 2'),
                  ),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => isCheckedExpanded = expanded);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
