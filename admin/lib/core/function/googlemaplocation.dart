 import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../class/StatusRequest.dart';

googlMaolocation() async {
    // fetch map of location
    Position cl = await Geolocator.getCurrentPosition(); // get current location

    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(cl.latitude, cl.longitude), // add location in google map
      zoom: 14.4746,
    );
     StatusRequest statusRequest = StatusRequest.loading;
    
    print("===== sherif => getlocatin function done ======= ");
  
  }