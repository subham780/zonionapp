import 'package:flutter/material.dart';
import 'package:zonionap/homes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZONION APP',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: Homescreen(),
    );
  }
}

