import 'package:flutter/material.dart';
import 'package:zonionap/Screens/categories.dart';
import 'package:zonionap/Screens/bottomnavbar.dart';
import 'package:zonionap/Services/get_location.dart';
import 'package:zonionap/Utilities/customtext.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Screens/partnerlist.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  final GetLocation locationObj;

  const HomeScreen({this.locationObj});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading:
                  IconButton(icon: Icon(Icons.location_on), onPressed: () {}),
              title: Text('Location Here'),
              trailing:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: boxDecoration,
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for store/item',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Categories(),
            //Divider(),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: CustomText(
                  text: "HOT STORES NEAR YOU",
                  color: black,
                  size: 15,
                ),
              ),
            ),
            PartnerList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
