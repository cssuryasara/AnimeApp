import 'package:flutter/material.dart';


//screens
// import 'Testing/testing.dart';
import 'screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(primaryColor: Color(0xFF141D26),),
    );
  }
}
