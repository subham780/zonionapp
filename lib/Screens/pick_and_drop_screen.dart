import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:zonionap/Screens/payment_method_screen.dart';
import 'package:zonionap/Screens/task_details_screen.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/reusable_card.dart';
import 'package:zonionap/Utilities/round_button.dart';

class PickAndDropScreen extends StatefulWidget {
  static String id = 'PickAndDropScreen';
  @override
  _PickAndDropScreenState createState() => _PickAndDropScreenState();
}

class _PickAndDropScreenState extends State<PickAndDropScreen> {
  bool isDrop = false;
  bool isList = false;
  bool isPickup = false;
  String taskDetails;
  String pickUpLocation = "Select pickup address";
  String dropLocation = "Select drop address";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pickup and Drop in simple steps...',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: boxDecoration,
                child: ListTile(
                  title: Text(pickUpLocation),
                  trailing: isPickup
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : Icon(Icons.add_circle_outline),
                  onTap: () async {
                    Prediction predicitions = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      language: 'en',
                      components: [Component(Component.country, "in")],
                    );
                    if (predicitions != null) {
                      setState(() {
                        pickUpLocation = predicitions.description;
                        isPickup = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: boxDecoration,
                child: ListTile(
                  title: Text(dropLocation),
                  trailing: isDrop
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : Icon(Icons.add_circle_outline),
                  onTap: () async {
                    Prediction predicitions = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      language: 'en',
                      components: [Component(Component.country, "in")],
                    );
                    if (predicitions != null) {
                      setState(() {
                        dropLocation = predicitions.description;
                        isDrop = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: boxDecoration,
                child: ListTile(
                  onTap: () async {
                    taskDetails = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskDetailsScreen()));
                    setState(() {
                      isList = true;
                    });
                    print(taskDetails);
                  },
                  title: Text('Give task details'),
                  trailing: isList
                      ? Icon(
                          Icons.playlist_add_check,
                          color: Colors.green,
                        )
                      : Icon(Icons.list),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: white,
                  cardChild: Center(
                    child: Text('Total Distance and this costs 56'),
                  ),
                ),
              ),
              RoundButton(
                width: double.infinity,
                onTap: () {
                  if (isDrop && isList && isPickup) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethodScreen()));
                  }
                },
                text: "Place Order",
              )
            ],
          ),
        ),
      ),
    );
  }
}
