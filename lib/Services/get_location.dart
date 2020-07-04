import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocation {
  List placemark;
  LatLng cordinates;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);

      cordinates = LatLng(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentLocationAddress() async {
    try {
      placemark = await Geolocator()
          .placemarkFromCoordinates(cordinates.latitude, cordinates.longitude);
      return placemark;
    } catch (e) {
      print(e);
    }
  }
}
