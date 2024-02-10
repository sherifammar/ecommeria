import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../services/servives.dart';

deliveryTime(double startlat, double startlong, int speed) async {
  Myservices myservices = Get.find();
  Position cl = await Geolocator.getCurrentPosition();

  double distanceInMeters = Geolocator.distanceBetween(
      startlat, startlong, cl.latitude, cl.longitude);

  print(
      "============= distance  => ${distanceInMeters / 1000 * speed}===============");

  String distanceOfDelivery = (distanceInMeters / 1000 * speed).toString();

  return myservices.sharedPreferences
      .setString('distanceOfDelivery', distanceOfDelivery);
    
}

//============================

