import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Featuredadd extends StatefulWidget {
  @override
  _FeaturedaddState createState() => _FeaturedaddState();
}

class _FeaturedaddState extends State<Featuredadd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('image/p1.jpg'),
          AssetImage('image/p2.jpg'),
          AssetImage('image/p3.jpg'),
          AssetImage('image/p4.jpg'),
          AssetImage('image/p5.jpg'),
          AssetImage('image/p6.jpg'),
          AssetImage('image/p7.jpg'),
          AssetImage('image/p8.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        

      ),
      
      
    );
  }
}