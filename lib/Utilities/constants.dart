import 'package:flutter/material.dart';

final kGoogleApiKey = "AIzaSyDD6dMxH31dAVoCPC8FioupJvOkb4kXQ00";
const red = Colors.red;
const white = Colors.white;
const black = Colors.black;
const grey = Colors.grey;

const largeButtonTextStyle =
    TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);

var boxDecoration = BoxDecoration(color: white, boxShadow: [
  BoxShadow(
    color: red[300],
    offset: Offset(1, 1),
    blurRadius: 4,
  ),
]);
const activeCardColour = Color(0xFF1D1E33);
var bottomNavBarDeco = BoxDecoration(color: white, boxShadow: [
  BoxShadow(
    color: red,
    offset: Offset(1, 1),
    blurRadius: 4,
  ),
]);

const resultTextStyle = TextStyle(
    fontSize: 20, color: Color(0xFF24D876), fontWeight: FontWeight.bold);

const kCircularTextField = InputDecoration(
  hintText: 'Enter Data Here',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
