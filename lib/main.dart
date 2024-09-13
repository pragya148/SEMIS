import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:office/BottomNavigation/notification.dart';
import 'package:office/BottomNavigation/notify.dart';
import 'package:office/Homework/Assignment.dart';
import 'package:office/Homework/HomeWorkList.dart';
import 'package:office/Homework/HomeworkVerify.dart';
import 'package:office/Homework/SocialStudy.dart';
import 'package:office/LoginScreen/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
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
