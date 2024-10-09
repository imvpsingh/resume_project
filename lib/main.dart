import 'package:flutter/material.dart';
import 'package:resume/resume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VP SINGH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/resume',
      routes: {
        '/resume': (context) => HomeScreen(),
      },
    );
  }
}
