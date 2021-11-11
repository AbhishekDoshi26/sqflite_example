import 'package:flutter/material.dart';
import 'package:sqflite_example/screens/page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Page1(),
    );
  }
}
