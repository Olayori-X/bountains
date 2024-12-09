import 'package:bountains/core/network/token.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

Future<void> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  GetIt.I<UserLocation>().latitude = position.latitude;
  GetIt.I<UserLocation>().longitude = position.longitude;

  print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
}
