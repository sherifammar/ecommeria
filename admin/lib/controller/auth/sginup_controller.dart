import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/auth/signup.dart';


abstract class Sginupcontroller extends GetxController {
  Sginup();
  gotosignin();
}

class SginupcontrollerImp extends Sginupcontroller {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find()); // binding and get.find => solve problem of constructure crud
  List data = [];

  @override
  gotosignin() {
    Get.offNamed(AppRoutes.login);
  }

  // to save data from response
  @override
  Sginup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text);
          // send username fro flutter to php page

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']); // main if scucess add in reponse in list of data
          Get.offNamed(AppRoutes.verifycode_sginup,
              arguments: {"email": email.text});// send email to verfiycode page
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "phone and email are exist");
          statusRequest = StatusRequest.failure; //error in data
         
        }
      }

      update();

      // Get.offNamed(AppRoutes.verifycode_sginup);
      // Get.delete<SginupcontrollerImp>();// استخدام البلت هن روت يمكن الاستغناء عن الدليت
      print("valid");
    } else {
      print("non valid");
    }
  }
  // TODO: implement Sginup

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
