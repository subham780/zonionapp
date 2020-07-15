import 'package:flutter/material.dart';
import 'package:zonionap/Screens/add_location_screen.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Screens/login_screen.dart';

import 'package:zonionap/Screens/pick_and_drop_screen.dart';
import 'package:zonionap/Screens/task_details_screen.dart';
import 'package:zonionap/Screens/welcome_screen.dart';

import 'Screens/order_place_screen.dart';
import 'Screens/payment_method_screen.dart';

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
      home: OrderPlaceScreen(),
      // initialRoute: WelcomeScreen.id,
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   LoginScreen.id: (context) => LoginScreen(),
      //   HomeScreen.id: (context) => HomeScreen(),
      // },
    );
  }
}
