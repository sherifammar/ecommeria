import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/auth/verifycodsignup.dart';

abstract class Verifycode_sginupcontroller extends GetxController {
  checkcode();
   gotoscuss_sginup(String verifycodesignup);
}

class Verifycode_sginupcontrollerImp extends Verifycode_sginupcontroller {

  VerfiyCodeSignupData verfiycodesignupData = VerfiyCodeSignupData(Get.find());

String? email;
StatusRequest statusRequest = StatusRequest.none;

  @override
 gotoscuss_sginup(String verifycodesignup) async{ // verifycodesignup == verificationCode

  statusRequest = StatusRequest.loading; // for  loading
      update();
      var response = await verfiycodesignupData.postData(
          email!,  verifycodesignup); 
          // === verifycode from otp pakage
          // === email from sign up page

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          
          Get.offNamed(AppRoutes.scucess_sginup);// send email to verfiycode page
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
  checkcode() {
    // TODO: implement Sginup
    throw UnimplementedError();
  }
  @override
  void onInit() {
 email= Get.arguments["email"];// var email receve email for signup controller  througth argument
      super.onInit();
  }
  @override
  void dispose() {
   
    super.dispose();
  }


  reSend() async{
    statusRequest = StatusRequest.loading; // for  loading
     
      var response = await verfiycodesignupData.resendtData(email!);

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          
        Get.defaultDialog(
              title: "sending", middleText: "verify code  are semd to ${email}");
          //error in data
        } 
      }

   
    
  }
}