import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAndDropScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _PickAndDropScreenState createState() => _PickAndDropScreenState();
}

class _PickAndDropScreenState extends State<PickAndDropScreen> {
  Completer<GoogleMapController> _controller = Completer();

  //Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.97066, 80.8911),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup and Drop in 3 simple steps...'),
      ),
      backgroundColor: Colors.white,
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
