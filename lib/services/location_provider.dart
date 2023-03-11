import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier{

  Position? _currentPosition;
  var _currentAddress = '';
  get currentAddress=>_currentAddress;

  /* Getting Location and Address */

   void getLocation() async{

    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    // Test if location services are enabled,accessing the position and request users of the
    // Permissions are denied, next time you could try requesting permissions again
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
       // ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(content: Text( 'Location Permission Denied')),);
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can continue accessing the position of the device.
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _currentAddress = await getAddressFromLatLong(_currentPosition!);
    notifyListeners();
  }

  Future<String> getAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (kDebugMode) {
      print(placemarks);
    }
    Placemark place = placemarks[0];
    _currentAddress = '${place.locality}';
     return _currentAddress;
  }

}