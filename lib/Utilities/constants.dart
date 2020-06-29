import 'package:flutter/material.dart';

const red = Colors.red;
const white = Colors.white;
const black = Colors.black;
const grey = Colors.grey;

var boxDecoration = BoxDecoration(color: white, boxShadow: [
  BoxShadow(
    color: red[300],
    offset: Offset(1, 1),
    blurRadius: 4,
  ),
]);

var bottomNavBarDeco = BoxDecoration(color: white, boxShadow: [
  BoxShadow(
    color: red,
    offset: Offset(1, 1),
    blurRadius: 4,
  ),
]);
