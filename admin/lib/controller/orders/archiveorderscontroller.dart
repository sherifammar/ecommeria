import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/orders/archive_data.dart';

import '../../data/model/ordersmodel.dart';

class ArchiveOrderscontroller extends GetxController {
   List<OrdersModel> archivedata = []; // to save data from response

  late StatusRequest statusRequest;
  Archivedata archive = Archivedata(Get.find()); 
  Myservices myservices = Get.find();
 getArchiveOrders() async {
    archivedata.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await archive.archiveData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        archivedata.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }
 // ================================================ 
  
  @override
  void onInit() {
 getArchiveOrders();     
    super.onInit();
  }
}




 