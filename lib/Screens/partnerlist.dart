import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Models/partner.dart';

List<Partner> partnerList = [
  Partner(image: 'p1.jpg'),
  Partner(image: 'p2.jpg'),
  Partner(image: 'p3.jpg'),
  Partner(image: 'p4.jpg'),
  Partner(image: 'p5.jpg'),
  Partner(image: 'p6.jpg'),
  Partner(image: 'p7.jpg'),
  Partner(image: 'p8.jpg'),
];

class PartnerList extends StatefulWidget {
  @override
  _PartnerListState createState() => _PartnerListState();
}

class _PartnerListState extends State<PartnerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: partnerList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: red[50],
                            offset: Offset(4, 6),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'image/${partnerList[index].image}',
                        width: 170,
                        height: 130,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

// Container(
//         height: 200,
//         child: new Carousel(
//           boxFit: BoxFit.cover,
//           images: [
//             AssetImage('image/p1.jpg'),
//             AssetImage('image/p2.jpg'),
//             AssetImage('image/p3.jpg'),
//             AssetImage('image/p4.jpg'),
//             AssetImage('image/p5.jpg'),
//             AssetImage('image/p6.jpg'),
//             AssetImage('image/p7.jpg'),
//             AssetImage('image/p8.jpg'),
//           ],
//           autoplay: true,
//           animationCurve: Curves.fastOutSlowIn,
//           animationDuration: Duration(milliseconds: 1000),
//           dotSize: 4.0,
//           indicatorBgPadding: 2.0,
//         ),
//       ),
