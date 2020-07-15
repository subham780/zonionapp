import 'package:flutter/material.dart';

class OrderPlaceScreen extends StatefulWidget {
  @override
  _OrderPlaceScreenState createState() => _OrderPlaceScreenState();
}

class _OrderPlaceScreenState extends State<OrderPlaceScreen> {
  Widget getList({Widget leading, Widget title, Widget trailing}) {
    return ListTile(
      leading: leading,
      title: title,
      trailing: trailing,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Details',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Order Successfully Placed'),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                getList(
                    leading: Icon(Icons.person),
                    title: Text('Your driver is Mr Subhash Nigam'),
                    trailing: Icon(Icons.call)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
