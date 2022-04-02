import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getCity()async{
  Position p = await GeolocatorPlatform.instance.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  var lat = p.latitude;
  var long = p.longitude;
  var placemarks = await GeocodingPlatform.instance.placemarkFromCoordinates(lat,long);
  return placemarks.first.locality.toString();
}
Future<String> getState()async{
  Position p = await GeolocatorPlatform.instance.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  var lat = p.latitude;
  var long = p.longitude;
  var placemarks = await GeocodingPlatform.instance.placemarkFromCoordinates(lat,long);
  return placemarks.first.administrativeArea.toString();
}
Future<List<String>> getCoordinates()async{
  Position p = await GeolocatorPlatform.instance.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  var lat = p.latitude;
  var long = p.longitude;
  return [lat.toString(),long.toString()];
}