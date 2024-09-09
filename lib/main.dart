import 'package:flutter/material.dart';
import 'package:office/Homework/Assignment.dart';
import 'package:office/LoginScreen/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Office',
        home: LoginScreen());
  }
}
