import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';

import '../../data/datasourse/remote/report/report_data.dart';

import '../../data/datasourse/remote/report/uses_data.dart';
import '../../data/model/adminreportmodels.dart';
import '../../data/model/usersadminmodel.dart';
import '../../data/model/usersmodels.dart';
import '../../data/model/winadminmodel.dart';

class Userscontroller extends GetxController {
  List<UsersadminModels> maxUsersdata = []; // to save data from response
  List<UsersModels> Data = [];

 late StatusRequest statusRequest;
  UsesData reportUsers = UsesData(Get.find());
  Myservices myservices = Get.find();

  // ================================================
  maxUsers() async {
    update();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportUsers
        .getMaxUsersData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        maxUsersdata
            .addAll(responsedata.map((e) => UsersadminModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// =============================

  getUnapproveusers() async {
       update();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportUsers
        .getUnapproveUsersData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        Data.addAll(responsedata.map((e) => UsersModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// ====================
  approveUsers(String usersid) async {
       update();
    Data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await reportUsers.approveUsersData(
        usersid); // getData for test_data page == it post data to url test

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

  @override
  void onInit() {
    maxUsers();
    getUnapproveusers();
    super.onInit();
  }
}
