import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import 'package:flutter/material.dart';


import '../core/function/handlingdatacontroller.dart';

import '../core/services/servives.dart';
import '../data/datasourse/remote/home_data.dart';
import 'package:workmanager/workmanager.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
}

class HomeControllerImp extends HomeController {
  Myservices myservices = Get.find();
  String? username;
  String? id;
  String? lang;
  late StatusRequest statusRequest;

  // connect o data
  @override
  initialData() {
    username = myservices.sharedPreferences
        .getString("username"); // get username for all app
    id = myservices.sharedPreferences.getString("id"); // save id of user
    lang = myservices.sharedPreferences
        .getString("lang"); // save lang for change desgin of  cart of home page
  
  }

  HomeData hometdata = HomeData(Get.find());
  @override
  void onInit() {
    initialData();
    getdata();

    // send notification
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata
        .getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  logout() {
    // ==== send notification
    String userid = myservices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "admin"); // can not send notification all users after log out
    FirebaseMessaging.instance.unsubscribeFromTopic(
        'admin${userid}'); //can not send notification certain user only after log out
    //     =========================
    myservices.sharedPreferences.clear();
    Get.defaultDialog(
      title: "warn",
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      middleText: "Do You Want Exit from APP",
      // cancelTextColor: ColorAPP.primaryColor,
      // confirmTextColor: ColorAPP.primaryColor,
      onCancel: () {},
      onConfirm: () {
        exit(0);
      },
    );
  }
}

///////////////////////// searchcontroller //////
