import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService with ChangeNotifier {
  String _currentLocation = '';
  bool _isLoadingLocation = true;
  String _errorMessage = '';
  Position? _currentPosition;

  String get currentLocation => _currentLocation;
  bool get isLoadingLocation => _isLoadingLocation;
  String get errorMessage => _errorMessage;
  Position? get currentPosition => _currentPosition;

  Future<void> getCurrentLocation() async {
    _isLoadingLocation = true;
    notifyListeners();

    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _errorMessage = 'Location permissions are denied';
          _isLoadingLocation = false;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _errorMessage = 'Location permissions are permanently denied';
        _isLoadingLocation = false;
        notifyListeners();
        return;
      }

      // Get current position
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get place name from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String locality = place.locality ?? '';
        String administrativeArea = place.administrativeArea ?? '';

        _currentLocation =
            locality.isNotEmpty
                ? '$locality, $administrativeArea'
                : administrativeArea;
      }

      _isLoadingLocation = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Could not determine location: $e';
      _isLoadingLocation = false;
      notifyListeners();
    }
  }
}
