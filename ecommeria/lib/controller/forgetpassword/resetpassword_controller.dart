import 'dart:convert';

import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class Resetpasswordcontroller extends GetxController {
  resetpassword();
  gotoscecussResetpassword();
}

class ResetpasswordcontrollerImp extends Resetpasswordcontroller {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  ResetPassWordForgetPasswordData resetPassWordForgetPasswordData =ResetPassWordForgetPasswordData(Get.find());
  String? email;

  @override
  gotoscecussResetpassword() async {
    if (password.text != repassword.text){
      return Get.defaultDialog(
          title: "warming", middleText: "password is not match");}

    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading
      update();
      var response =
          await resetPassWordForgetPasswordData.postData(email!, password.text);

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.scucess_resetpassword);
        } else {
          Get.defaultDialog(title: "warning", middleText: "try again");
          statusRequest = StatusRequest.failure; //error in data
          // print("shergghjj");
        }
      }

      update();

      print("valid");
    } else {
      print("non valid");
    }
  }

  @override
  resetpassword() {}

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
