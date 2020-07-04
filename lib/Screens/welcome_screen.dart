import 'package:flutter/material.dart';

import 'add_location_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void waitFunction() async {
    await new Future.delayed(new Duration(seconds: 4));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddLocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    waitFunction();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage('image/zonion.jpg'),
          ),
        ),
      ),
    );
  }
}
