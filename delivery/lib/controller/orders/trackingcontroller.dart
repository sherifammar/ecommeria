import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/nameroutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/function/getpolyline.dart';
import '../../core/services/servives.dart';
import '../../data/model/ordersmodel.dart';
import 'acceptecontroller.dart';

class Trackingcontroller extends GetxController {
  AcceptController acceptcontroller = Get.find();
  Timer? timer;
  StreamSubscription<Position>? positionStream;
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  Set<Polyline> polylineset = {};

  GoogleMapController? gMc;
  CameraPosition? kGooglePlex;

  Myservices myservices = Get.find();
  List<Marker> makers = [];
  late double custlat; // for custom == user
  late double custlong; // for custom

  late double deliverylat; // for delivery
  late double deliverylong;

//===============================

  getCuurentlocation() {
    // make permission
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(
          double.parse(ordersModel.addressLat!), // lat of user
          double.parse(
              ordersModel.addressLong!)), // add location of users in google map
      zoom: 12.4746,
    );
    
    makers.add(Marker(
        markerId: MarkerId("Custome"), // user(destination)
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      deliverylat = position!.latitude; // for delivery boy
      deliverylong = position.longitude;
      print("================== current delivery position ============");
      print("================== latitude :: ${position.longitude.toString()}");
      print("================== latitude :: ${position.latitude.toString()}");
      print("================== current delivery position ============");

      if (gMc != null) {
        // make change move of cameria
        gMc!.animateCamera(CameraUpdate.newLatLng(
            LatLng(deliverylat, deliverylong))); // change cameria position
      }

      makers.removeWhere((element) =>
          element.markerId.value ==
          "Delivery"); // remove old marker of delivery then add new marker
      makers.add(Marker(
          markerId: MarkerId("Delivery"),
          position: LatLng(position.latitude, position.longitude)));
      update();
    });
  }

// =================
  initalGetpolyline() async {
    // draw pollyline in map

    custlat = double.parse(ordersModel.addressLat!); // for user(dest)
    custlong = double.parse(ordersModel.addressLong!);
    await Future.delayed(Duration(seconds: 1)); // await google map
    polylineset =
        await getpolylinemap(deliverylat, deliverylong, custlat, custlong);
    update();
  }

// ====================

  refreshCurrentDevLocartion() async {
    // insert location of delivery
    // save in fire base
    await Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery") // name of table
          .doc(ordersModel.ordersId) // name of collection
          .set({
        // update location of delivery
        "lat": deliverylat,
        "long": deliverylong,
        "deliveryid": myservices.sharedPreferences.getString("id")
      });
    });
  }
// ==========================

  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await acceptcontroller.doneOrders(
        ordersModel.ordersId!, ordersModel.addressUsersid!);
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    getCuurentlocation();
    refreshCurrentDevLocartion();
    ordersModel = Get.arguments["ordersmodel"];
    initalGetpolyline();
    super.onInit();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    gMc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}
