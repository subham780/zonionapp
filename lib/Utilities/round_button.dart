import 'package:flutter/material.dart';

import 'constants.dart';

class RoundButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double height, width;
  final Color color;
  const RoundButton(
      {this.text = 'Submit',
      this.color = Colors.green,
      this.height = 40,
      this.width = 200,
      @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onTap,
          minWidth: width,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: largeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
