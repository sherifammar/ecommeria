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
}
