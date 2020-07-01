import 'package:flutter/material.dart';
import 'package:zonionap/Screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void getCurrentLocation() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamed(context, LoginScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Expanded(
          child: Hero(
            tag: 'logo',
            child: Container(
              child: Image(
                image: AssetImage('image/zonion.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
