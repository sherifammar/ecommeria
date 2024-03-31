import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';

import '../../core/function/determinePosition.dart';

class AddaddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController> completecontroller =
      Completer<GoogleMapController>();
  Position? cl;

  CameraPosition? kGooglePlex;
  List<Marker> makers = [];
  double? lat; // var used by addmarker
  double? long;
 // ==== add automatic name location in marker 
  // String? nameCity;
  // String? nameStreet;
  // String? nameAddress;
  // ==============================================


  addMarker(LatLng latlng) {
    // add marker for current your address=> LatLng == position
    makers.clear();
    makers.add(Marker(markerId: MarkerId("1"), position: latlng));
    lat = latlng.latitude; // insert lat
    long = latlng.longitude;

    // fetchNameLocation(lat,long);  ======function file for me

    update();
    print("=====  done marker of map ======");
  }
// Future<Position>

  getlocation() async {
    // fetch map of location
    Position cl = await Geolocator.getCurrentPosition(); // get current location

    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(cl.latitude, cl.longitude), // add location in google map
      zoom: 14.4746,
    );
    addMarker(LatLng(cl.latitude, cl.longitude));// add marker on map of current location
    statusRequest = StatusRequest.loading;
    update();
    print("===== sherif => getlocatin function done ======= ");
  
  }

  gotoDetaillsetting() {
    Get.toNamed(AppRoutes.setting, arguments:
            //  {"lat": lat.toString(),"long": long.toString()}// for marker method of wael
            {"lat": 5.5.toString(), 
            "long": 6.6.toString(),

            //=== add automatic location
            // "namecity":nameCity,
            // "namestreet": nameStreet,
            // "nameaddress":  nameAddress
            
              } // for testing
        );
  }

    gotoDetaillcatogeris() {
    Get.toNamed(AppRoutes.catogeriesadd, arguments:
            //  {"lat": lat.toString(),"long": long.toString()}// for marker method of wael
            {"lat": 5.5.toString(), 
            "long": 6.6.toString(),

            //=== add automatic location
            // "namecity":nameCity,
            // "namestreet": nameStreet,
            // "nameaddress":  nameAddress
            
              } // for testing
        );
  }

  @override
  void onInit() {
    determinePosition();// premission
    getlocation();
  //   fetchNameLocation(lat,long); // add automatic location
    super.onInit();
  }
}
