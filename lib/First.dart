import 'package:flutter/material.dart';
import 'package:office/Second.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const First());
}

class First extends StatelessWidget {
  const First({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/Group1.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/Asset1.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Second()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        const Color(0xFF0B2457), // RGB values: (11, 36, 87)
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadowColor: Colors.black,
                    elevation: 10,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text('Get Started'),
                      ),
                      Icon(Icons.arrow_circle_right_rounded, size: 24),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      launch('https://asterinnovations.com/');
                    },
                    child: Text(
                      'Aster Innovations',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Icon(Icons.copyright_rounded, size: 16),
                  Text(
                    ' All Rights Reserved (V 1.0.0.0)',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
