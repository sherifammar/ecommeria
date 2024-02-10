import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswprdcontroller extends GetxController {
  CheckEmailData checkemaildata = CheckEmailData(Get.find());
  checkemail();
  // gotoVerifyPage();
}

///////////////////////
class ForgetPasswprdcontrollerImp extends ForgetPasswprdcontroller {
  late TextEditingController email; // make controller in text feild
  GlobalKey<FormState> formstate =
      GlobalKey<FormState>(); // globel key for vaild

  StatusRequest statusRequest =StatusRequest.none;
  @override
  // gotoVerifyPage() {
  //   var formdata = formstate.currentState;
  //   if (formdata!.validate()) {
  //     // check to valid
  //     Get.offNamed(AppRoutes.verifycode); // go to verifycode page
  //     print("valid");
  //   } else {
  //     print("non valid");
  //   }
  // }

  @override
  checkemail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading
      update();
      var response = await checkemaildata.postData(email.text);

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifycode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "warning", middleText: "email are not exist");
          statusRequest = StatusRequest.failure; //error in data
          
        }
      }

      update();

      print("valid");
    } else {
      print("non valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController(); // start on run

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
