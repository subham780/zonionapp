import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:zonionap/Utilities/bottom_button.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/customtext.dart';

import 'add_location_screen.dart';

class LocationErrorScreen extends StatefulWidget {
  @override
  _LocationErrorScreenState createState() => _LocationErrorScreenState();
}

class _LocationErrorScreenState extends State<LocationErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CustomText(
              text: 'We don\'t deliver here yet ',
            ),
            BottomButton(
              text: 'Change Location',
              onTap: () async {
                Prediction predicitions = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: kGoogleApiKey,
                  language: 'en',
                  components: [Component(Component.country, "in")],
                );
                if (predicitions != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddLocationScreen();
                  }));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
