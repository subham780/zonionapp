import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:zonionap/Screens/home_screen.dart';
import 'package:zonionap/Screens/login_screen.dart';
import 'package:zonionap/Services/get_location.dart';
import 'package:zonionap/Utilities/bottom_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zonionap/Utilities/constants.dart';

class AddLocationScreen extends StatefulWidget {
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  GoogleMapController _controller;
  GetLocation locationObj;
  static double lat;
  static double long;
  List<dynamic> placemark;
  String subLocality = "Locating....";
  final List<Marker> markers = [];
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  bool showBannerChecked = false;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getLocationAddress();
  }

  Widget getGoogleMap({@required LatLng initialPosition, double zoom = 16}) {
    return GoogleMap(
      zoomControlsEnabled: false,
      markers: markers.toSet(),
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: initialPosition,
        zoom: zoom,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
      onTap: (cordinate) {
        setCameraPositionAndMarker(cordinate: cordinate);
      },
    );
  }

  void setCameraPositionAndMarker({LatLng cordinate}) {
    _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
    addMarker(cordinate);
  }

  addMarker(cordinate) {
    int id = 1;

    setState(() {
      locationObj.cordinates = cordinate;
      getLocationAddress();
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  bool locationValidation({GetLocation locationObj}) {
    //TODO: Add location validation here.
    return true;
  }

  Future getLocationAddress() async {
    await locationObj.getCurrentLocationAddress();
    setState(() {
      placemark = locationObj.placemark;
      lat = locationObj.cordinates.latitude;
      long = locationObj.cordinates.longitude;
      subLocality = placemark[0].subLocality;
    });
  }

  Future getCurrentLocation() async {
    locationObj = GetLocation();
    await locationObj.getCurrentLocation();
    await getLocationAddress();

    bool value = locationValidation(locationObj: locationObj);
    lat = locationObj.cordinates.latitude;
    long = locationObj.cordinates.longitude;
    setCameraPositionAndMarker(cordinate: LatLng(lat, long));

    if (value) {
      showBannerChecked = false;
    } else {
      showBannerChecked = true;
    }
  }

  Widget createTextField(String text) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void handlePredictions({Prediction prediction}) async {
    if (prediction != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(prediction.placeId);

      setState(() {
        lat = detail.result.geometry.location.lat;
        long = detail.result.geometry.location.lng;
        setCameraPositionAndMarker(cordinate: LatLng(lat, long));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 400,
              width: 400,
              child: getGoogleMap(
                initialPosition: LatLng(26, 80),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.location_on,
                ),
                title: Text(
                  subLocality,
                ),
                trailing: BottomButton(
                  text: 'Change',
                  onTap: () async {
                    Prediction predicitions = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      language: 'en',
                      components: [Component(Component.country, "in")],
                    );
                    if (predicitions != null) {
                      handlePredictions(prediction: predicitions);
                    }
                  },
                ),
              ),
              createTextField('HOUSE/FLAT/BLOCK NO.'),
              createTextField('LANDMARK'),
              createTextField('SAVE AS'),
              ListTile(
                trailing: AbsorbPointer(
                  absorbing: showBannerChecked,
                  child: BottomButton(
                    text: 'Save',
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return HomeScreen(locationObj: locationObj);
                      // }));
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    height: 100,
                    width: 100,
                    color: showBannerChecked ? Colors.grey : Colors.green,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
