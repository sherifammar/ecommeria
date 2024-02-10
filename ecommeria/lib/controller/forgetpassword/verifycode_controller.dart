import 'dart:convert';

import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/data/datasourse/remote/forgetpassword/verfiycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class VerifyCodecontroller extends GetxController {
  checkcode();
  gotoresetpassword(verifycode);
}

class VerifyCodecontrollerImp extends VerifyCodecontroller {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest? statusRequest;
  @override
  gotoresetpassword(verifycode) async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifycode);

    print("**************** $response*********");

    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword,
            arguments: {"email": email}); // send email to verfiycode page
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verify code  are error");
        statusRequest = StatusRequest.failure; //error in data
        // print("shergghjj");
      }
    }

    update();
  }

  @override
  checkcode() {}
  @override
  void onInit() {
    email = Get.arguments["email"];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
