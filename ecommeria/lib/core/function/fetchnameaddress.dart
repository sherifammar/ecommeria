import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


import '../../controller/address/EditAddress_controller.dart';

import '../class/StatusRequest.dart';

fetchNameAndMaplocation() async {
  // fetch map of location
  Position cl = await Geolocator.getCurrentPosition(); // get current location
  String lat = cl.latitude.toString();
  String long = cl.longitude.toString();
  List<Placemark> placemarks =
      placemarkFromCoordinates(cl.latitude, cl.longitude) as List<Placemark>;

  print(placemarks[0].country);
  print(placemarks[0].locality);
  print(placemarks[0].name);

  // editAddressController autcontroller = Get.put(editAddressController());
  // autcontroller.autoEditeAddressData( placemarks[0].locality!,placemarks[0].country!,placemarks[0].name!,lat,long);
  // StatusRequest statusRequest = StatusRequest.loading;

  print("===== sherif => getlocatin function done ======= ");
}
