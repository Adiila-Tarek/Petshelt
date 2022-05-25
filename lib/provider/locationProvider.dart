import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class locationProvider with ChangeNotifier {
  late Location _location;

  Location get location => _location;
  late LatLng _locationPosition;

  LatLng get locationPosition => _locationPosition;
  bool locationServiceActive = true;

  locationProvider() {
    _location = new Location();
  }

  initalization() async {
    await getUserLocation();
  }

  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _premissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _premissionGranted = await location.hasPermission();
    if (_premissionGranted == PermissionStatus.denied) {
      _premissionGranted = await location.requestPermission();
      if (_premissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
      //print(_locationPosition);
      notifyListeners();
    });
  }
}
