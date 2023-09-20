import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

requestLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Get.snackbar("Warning", "Please turn the location permission on");
  }
  permission = await Geolocator.checkPermission();
   if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Get.snackbar("Warning", "Please turn the location permission on");
    }
  }
  // if (permission == LocationPermission.deniedForever) {
  //   return Get.snackbar("Warning!",
  //       "You can't use the Application without confirming location permission");
  // }
}

initialServices() async {
   requestLocationPermission();
  await Get.putAsync(() => MyServices().init());
}
