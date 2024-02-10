import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';

import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/address_data.dart';
import '../../data/model/addressmodel.dart';

class editAddressController extends GetxController {
  String? lat;
  String? long;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? addressname;
  AddressData addressdata = AddressData(Get.find());
  Myservices myservices = Get.find();
  late AddressModel addressModel;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  initailDta() {
    city = TextEditingController();
    street = TextEditingController();
    addressname = TextEditingController();
    addressModel = Get.arguments["addressmodel"];

    //============== testing
    lat = 1.1.toString(); // for testing
    long = 2.2.toString();

    //======================== add late long from new location automatica
    // googlMaolocation();// add late long from new location automatica
  }

  StatusRequest statusRequest = StatusRequest.none;

  late String? addressid = addressModel.addressId;

  editeAddressData() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressdata.editAddress(
          addressid!, city!.text, street!.text, lat!, long!, addressname!.text);

      print("**************** $response ===+++++++===");
      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoutes.home);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print("non vaild");
    } // update ui
  }

  //  ================== sherif
  // autoEditeAddressData(String acity, String astreet, String aaddressname,
  //     String lat, String long) async {
  //   statusRequest = StatusRequest.loading;
  //   update();

  //   var response = await addressdata.editAddress(
  //       addressid!, acity, astreet, lat, long, aaddressname);

  //   print("**************** $response ===+++++++===");
  //   statusRequest = handdlingData(
  //       response); // it give statusrequest error or statusrequest sucess

  // if (StatusRequest.success == statusRequest) {
  //   if (response['status'] == "success") {
  //     Get.offAllNamed(AppRoutes.home);
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //     }
  //   }

  //   update(); // update ui
  // }

  //  ================================
  @override
  void onInit() {
    initailDta();
  }

  @override
  void dispose() {
    city?.dispose();
    street?.dispose();
    addressname?.dispose();

    super.dispose();
  }
}
