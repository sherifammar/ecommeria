import 'dart:async';

import 'package:ecommeria/core/class/StatusRequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/address_data.dart';
import '../../data/model/addressmodel.dart';

class AddressViewcontroller extends GetxController {
  //  StatusRequest statusRequest= StatusRequest.none;
  AddressData addressdata = AddressData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  List<AddressModel> data = [];

  getAddressview() async {
    statusRequest = StatusRequest.loading;

    var response = await addressdata
        .viewaddress(myservices.sharedPreferences.getString("id")!);

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];

        data.addAll(responsedata.map((e) => AddressModel.fromJson(e)));

        print(data);
        print("address ");
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteAddress(String addressid) {
    addressdata.removeAddress(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  gotoediteAddress(AddressModel Addressmodel) {
    Get.toNamed(AppRoutes.editeaddress, arguments: {
      "addressmodel": Addressmodel,
       "lat": Addressmodel.addressLat.toString(),
      "long": Addressmodel.addressLong.toString(),
      // "lat": 1.1.toString(),
      // "long": 2.2.toString(),
    });
  }

  @override
  void onInit() {
    getAddressview();
    super.onInit();
  }
}
