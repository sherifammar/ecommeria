import 'dart:async';



import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';

import '../../data/datasourse/remote/orders/orderdetail_data.dart';
import '../../data/model/cartmodel.dart';
import '../../data/model/ordersmodel.dart';


class OrdersDetailcontroller extends GetxController {
  late StatusRequest statusRequest = StatusRequest.none;
  List<CartModel> data = [];
  OrdersDetailData ordersDetail = OrdersDetailData(Get.find());
  late OrdersModel ordersmodels;

  Completer<GoogleMapController> completecontroller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;
  List<Marker> makers = [];
  late double lat;
  late double long;

  getlocation() async {
// locatiom of custome 
    if (ordersmodels.ordersType == "0") {
      CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(
          double.parse(ordersmodels.addressLat!),
          double.parse(
              ordersmodels.addressLong!)), // add location in google map
      zoom: 12.4746,
    );
    statusRequest = StatusRequest.loading;
    update();
    print("===== sherif => getlocatin function done ======= ");

    //======================== sherif ======================
    // makers.add(Marker(markerId: MarkerId("1"), position: latlng));
    // LatLng latlng =  LatLng(double.parse(ordersmodels.addressLat!), double.parse(ordersmodels.addressLong!));
    // =========================
    makers.add(Marker(
        markerId: MarkerId("${ordersmodels.addressStreet}"),
        position: LatLng(double.parse(ordersmodels.addressLat!),
            double.parse(ordersmodels.addressLong!))));
    print("=====  done marker of map ======");
  }
    }
    

  getOrdersdetail() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await ordersDetail.getordersdetailData(ordersmodels.ordersId!);

    print("**************** $response");
    statusRequest = handdlingData(response); 
    // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update(); // update ui
  }

  @override
  void onInit() {
    ordersmodels = Get.arguments["ordersmodel"];
    getOrdersdetail();

    // getlocation();
    super.onInit();
  }
}
