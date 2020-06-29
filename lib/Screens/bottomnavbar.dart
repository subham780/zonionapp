import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';

class BottomNavBar extends StatelessWidget {
  Widget getNavBarOptions({Icon materialIcon}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
            icon: materialIcon,
            onPressed: () {
              print('pressed bottom nav bar option');
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomNavBarDeco,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getNavBarOptions(materialIcon: Icon(Icons.home)),
          getNavBarOptions(materialIcon: Icon(Icons.add_shopping_cart)),
          getNavBarOptions(materialIcon: Icon(Icons.account_circle)),
          getNavBarOptions(materialIcon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
