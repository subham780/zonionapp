import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';

class BottomNavBar extends StatelessWidget {
  Widget getNavBarOptions({Widget child}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
            icon: child,
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
          getNavBarOptions(child: Icon(Icons.home)),
          getNavBarOptions(child: Icon(Icons.add_shopping_cart)),
          getNavBarOptions(child: Icon(Icons.account_circle)),
          getNavBarOptions(child: Icon(Icons.search)),
        ],
      ),
    );
  }
}
