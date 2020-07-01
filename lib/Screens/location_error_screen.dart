import 'package:flutter/material.dart';

class LocationErrorScreen extends StatefulWidget {
  @override
  _LocationErrorScreenState createState() => _LocationErrorScreenState();
}

class _LocationErrorScreenState extends State<LocationErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Expanded(
          child: Container(
              child: FlatButton(
            onPressed: (
              Navigator.pushNamed(context, routeName);
            ) {},
            child: Text(
                'Click here to change location we don\'t deliver here yet!!'),
          )),
        ),
      ),
    );
  }
}
