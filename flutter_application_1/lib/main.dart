import 'package:flutter/material.dart';
import 'package:flutter_application_1/appraisal_page.dart';
import 'package:flutter_application_1/attendance_page.dart';
import 'package:flutter_application_1/welfare_page.dart';
import 'training_page.dart';
import 'welfare_page.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'employees_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HR Management System',
      home: const HomePage(),
    );
  }
}