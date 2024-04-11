import 'dart:io';

import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/core/services/servives.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  Myservices myservices = Get.find();

  logout() {
    // ==== send notification 
    String userid = myservices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users"); // can not send notification all users after log out
    FirebaseMessaging.instance.unsubscribeFromTopic('users${userid}'); //can not send notification certain user only after log out
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
                   Get.offAllNamed(AppRoutes.login);
                  },
                );
    
  }
//===========================
  bool isSwitchnotification = false;
  String? username;
  String? note;
  checkNotification(bool valuenoyification) {
    if (valuenoyification == true) {
      String userid = myservices.sharedPreferences.getString("id")!;
      myservices.sharedPreferences.setString("notification", "okey");
      note = myservices.sharedPreferences.getString("notification");
      FirebaseMessaging.instance
          .subscribeToTopic("users"); //send notification all users
      FirebaseMessaging.instance.subscribeToTopic('users${userid}');

      isSwitchnotification = valuenoyification;
      print("/// ok notification /////////");
      update();
    } else {
      String userid = myservices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.unsubscribeFromTopic(
          "users"); // can not send notification all users after log out
      FirebaseMessaging.instance.unsubscribeFromTopic('users${userid}');
      myservices.sharedPreferences.setString("notification", "no");
      note = myservices.sharedPreferences.getString("notification");
      print("/// delet  **notification /////////");
      isSwitchnotification = false;
      update();
    }
  }

  selectNotification() {
    if (myservices.sharedPreferences.getString("notification") == "okey") {
      note = myservices.sharedPreferences.getString("notification");
      isSwitchnotification = true;
    } else {
      isSwitchnotification = false;

    }
  }

  @override
  void onInit() {
    username = myservices.sharedPreferences.getString("username")!;

    note = myservices.sharedPreferences.getString("notification");
    print(myservices.sharedPreferences.getString("notification"));

    //==========================

    selectNotification();

    super.onInit();
  }

}
