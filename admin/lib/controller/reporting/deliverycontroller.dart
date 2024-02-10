import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';

import '../../data/datasourse/remote/report/delivery_data.dart';

import '../../data/model/deliveryadminmodels.dart';
import '../../data/model/deliverymodels.dart';
import '../../data/model/usersadminmodel.dart';
import '../../data/model/usersmodels.dart';

class Deliverycontroller extends GetxController {
  List<DeliveryadminModels> maxDeliverydata = []; // to save data from response
  List<DeliveryModels> Data = [];

  late StatusRequest statusRequest ;
  DeliveryData reportDelivery = DeliveryData(Get.find());
  Myservices myservices = Get.find();

  // ================================================
  maxDelivery() async {
    maxDeliverydata.clear();
    update();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportDelivery
        .getMaxDeliveryData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        maxDeliverydata
            .addAll(responsedata.map((e) => DeliveryadminModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// =============================

  getUnapprovedelivery() async {
    update();
    Data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportDelivery
        .getUnapprovedeliveryData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        Data.addAll(responsedata.map((e) => DeliveryModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// ====================
  approveDelivery(String deliveryid) async {
    update();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportDelivery.approveDeliveryData(
        deliveryid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Approve is success");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// =============
  removeDelivery(String deliveryid) async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportDelivery.deletDelivery(
        deliveryid); // getData for test_data page == it post data to url test
        Data.removeWhere((element) => element.deliveryId == deliveryid);

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Success", "Remove is success");
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  @override
  void onInit() {
    maxDelivery();
    getUnapprovedelivery();
    super.onInit();
  }
}
