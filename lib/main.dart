import 'package:flutter/material.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Screens/login_screen.dart';
import 'package:zonionap/Screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZONION',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
