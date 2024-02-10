import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../services/servives.dart';


//============================

priceOfdelivery(double startlat, double startlong, int pricepekilo) async {
  Myservices myservices = Get.find();
  Position cl = await Geolocator.getCurrentPosition();

  double distanceInMeters = Geolocator.distanceBetween(
      startlat, startlong, cl.latitude, cl.longitude);

String priceofdelivery=(distanceInMeters / 1000 * pricepekilo).toString();


  print("============= price : +> ${distanceInMeters / 2000 * pricepekilo} ===============");
    return myservices.sharedPreferences.setString('priceofdelivery', priceofdelivery);
  
}

