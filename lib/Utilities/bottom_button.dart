import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double height, width;
  final Color color;
  BottomButton(
      {@required this.text,
      @required this.onTap,
      this.height,
      this.width,
      this.color = Colors.green});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            color: color),
        height: 40,
        width: 80,
        child: Center(
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
