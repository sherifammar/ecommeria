import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/determinePosition.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/message_data.dart';
import '../../data/datasourse/remote/setting_data.dart';

class Settingcontroller extends GetxController {
  Myservices myservices = Get.find();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController body;
  late TextEditingController deliverytime;
  late TextEditingController speed;
  late TextEditingController price;

  String? lat;
  String? long;

  late StatusRequest statusRequest = StatusRequest.none;
  SettingData settinginfo = SettingData(Get.find());

  initailDta() {
    //============== testing
    // lat = 1.1.toString(); // for testing
    // long = 2.2.toString();
 lat = Get.arguments["lat"];
 long = Get.arguments["long"];
    // "lat": 5.5.toString(), 
    //         "long": 5.5.toString(),

    print( "lat ==> ${lat}");
      print( "long ==> ${long}");

    //======================== add late long from new location automatica
    // googlMaolocation();// add late long from new location automatica
  }

  insertSetting() async {
    if (formState.currentState!.validate()) {
      update();
      statusRequest = StatusRequest.loading;
      var response = await settinginfo.addData(
      
          title.text,
          body.text,
          deliverytime.text,
          lat!,
          long!,
          speed.text,
          price.text
          );

      print("****************   $response");
      statusRequest = handdlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("Success", "process done");
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }

  fetchlocation() async {
    Position cl = await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();
    speed = TextEditingController();
    price = TextEditingController();
    deliverytime = TextEditingController();
initailDta();
    super.onInit();
  }
  @override
  void dispose() {
    title.dispose();
     body.dispose();
      speed.dispose();
       price.dispose();
        deliverytime.dispose();
         
  }
}
