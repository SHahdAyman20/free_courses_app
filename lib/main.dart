import 'package:flutter/material.dart';
import 'package:free_courses_app/screens/started/started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Free Courses',
      debugShowCheckedModeBanner: false,
      home: StartedScreen(),
    );
  }
}
