import 'package:ecommeria/core/class/StatusRequest.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/data/datasourse/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';

import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';

class DetailAddresscontroller extends GetxController {
  String? lat;
  String? long;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? addressname;

  
/////////////////////////////////
  // String? nameCity;
  // String? nameStreet;
  // String? nameAddress;
  //////////////////////////////
  AddressData addressdata = AddressData(Get.find());
  Myservices myservices = Get.find();
//==================================

  //=========================================================
   initailDta() {
    lat = Get.arguments["lat"];// for addaddress contoroller
    long = Get.arguments["long"];
    // nameCity = Get.arguments["namecity"];
    
   

    city = TextEditingController();
    street = TextEditingController();
    addressname = TextEditingController();
    print(lat);
    print(long);
    //  print(nameCity);
    
  }
//=================================================

   StatusRequest statusRequest= StatusRequest.none; // for error => solved by StatusRequest.none



add_AddressData() async {
    statusRequest = StatusRequest.loading; 
    update();
    var response = await addressdata.addAddress(
      myservices.sharedPreferences.getString("id")!,
      //  city!.text = nameCity.toString(), // =============for automatic location
      city!.text ,
      street!.text,
      lat!,
      long!,
      addressname!.text,
    ); 

    print("**************** $response ===+++++++===");
    statusRequest = handdlingData(response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.home);
                  Get.snackbar("Scuccess", "Make check");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }


  // add_AddressData() async {
  //   statusRequest = StatusRequest.loading; 
  //   update();
  //   var response = await addressdata.addAddress(
  //     myservices.sharedPreferences.getString("id")!,
  //     city!.text,
  //     street!.text,
  //     lat!,
  //     long!,
  //     addressname!.text,
  //   ); 

  //   print("**************** $response ===+++++++===");
  //   statusRequest = handdlingData(response); // it give statusrequest error or statusrequest sucess

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.offAllNamed(AppRoutes.home);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }

  //   update(); // update ui
  // }
  //==============================================


  @override
  void onInit() {
    initailDta();
    
    super.onInit();
  }
}
