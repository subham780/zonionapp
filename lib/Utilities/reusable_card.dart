import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final double height;
  final double width;
  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress,
      this.height = 200,
      this.width = 400});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          child: cardChild,
          margin: EdgeInsets.all(10),
          decoration: boxDecoration.copyWith(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            color: colour,
          )),
    );
  }
}
