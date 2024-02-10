import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/determinePosition.dart';

import '../../core/function/getpolyline.dart';
import '../../core/services/servives.dart';
import '../../data/model/ordersmodel.dart';

class Trackingcontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  Set<Polyline> polylineset = {};

  GoogleMapController? gMc;
  CameraPosition? kGooglePlex;

  Myservices myservices = Get.find();
  List<Marker> makers = [];
  late double custlat; // for custom
  late double custlong; // for custom

  late double deliverylat; // for delivery
  late double deliverylong;

  getCuurentlocation() {
   
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)), // add location in google map
      zoom: 12.4746,
    );
    makers.add(Marker(
        markerId: MarkerId("user"), // user
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
  }
// ================ delet it================
  // initalGetpolyline() async {
  //   custlat = double.parse(ordersModel.addressLat!); // for user
  //   custlong = double.parse(ordersModel.addressLong!);
  //   await Future.delayed(Duration(seconds: 1));
  //   polylineset =
  //       await getpolylinemap(deliverylat, deliverylong, custlat, custlong);
  //   update();
  // }

  upDateMarkers(double newlat , double newlong) { // add marker of delivery boy
    makers.removeWhere((element) =>
        element.markerId.value ==
        "Dest"); // remove old marker then add new marker
    makers.add(Marker(
        markerId: MarkerId("Dest"),
        position: LatLng(newlat, newlong)));
    update();
  }

  listenDeliverylocation() { // listen and upadete position of delivery boy
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        custlat = event.get("lat"); // for delivery
       custlong = event.get("long");
upDateMarkers(custlat ,  custlong) ;
      }
      
    });
  }

  @override
  void onInit() {
    getCuurentlocation();
    ordersModel = Get.arguments["ordersmodel"];
    // initalGetpolyline();
     listenDeliverylocation();
    super.onInit();
  }

  @override
  void onClose() {
    gMc!.dispose();

    super.onClose();
  }
}
