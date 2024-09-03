import 'package:flutter/material.dart';
import 'package:office/Files/HomeWorkList.dart';
import 'package:office/First.dart';
import 'package:office/HomeScreen.dart';
import 'package:office/LoginScreen.dart';
import 'package:office/LoginScreen2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Office',
      home: HomeScreen(),
    );
  }
}
