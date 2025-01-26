import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  //bool serviceEnable
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permission Denid');
    }
  }

  if (permission == LocationPermission.deniedForever){
    //permission are denied forver
    return Future.error(
      'Location Permission are Parmanently denied, we cannot request Permission'
    );
  }
  return await Geolocator.getCurrentPosition();
}