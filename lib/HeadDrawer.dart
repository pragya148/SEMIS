import 'package:flutter/material.dart';

class MyHeadDrawer extends StatefulWidget {
  const MyHeadDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeadDrawer> createState() => _MyHeadDrawerState();
}

class _MyHeadDrawerState extends State<MyHeadDrawer> {
  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/Young.png'),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Emily Sheren",
                style: TextStyle(color: blueColor, fontSize: 18),
              ),
              Text(
                "Good Afternoon!",
                style: TextStyle(color: blueColor, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
