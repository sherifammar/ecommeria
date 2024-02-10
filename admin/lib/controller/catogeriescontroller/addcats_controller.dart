import 'dart:io';
import 'dart:math';

import 'package:admin/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasourse/remote/catogeries/catogeries_data.dart';
import 'catsview_controller.dart';

class Addcatscontroller extends GetxController {
  CatogeriesData testData = CatogeriesData(Get.find());

   StatusRequest? statusRequest = StatusRequest.none; // for error

  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController catsname;
  late TextEditingController catsnamear;

  addCats() async {
    if (formState.currentState!.validate()) {
      if (file == null) return Get.snackbar("Warn", "Please chosse Image");
      statusRequest = StatusRequest.loading; // for  loading

      update();
      Map data = {
        "categoriesname": catsname.text,
        "categoriesnamear": catsnamear.text,
      };
      var response = await testData.addCatogeries(data,
          file!); // getData for test_data page == it post data to url test

      print("****************catiview controller:   $response");
      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.catogeriesview);
          CatogeriesViewcontroller c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update(); // update ui
    }
  }

  chooseImage() async {
    file = await fileupLoadGallery(false);
    update();
  }

  @override
  void onInit() {
    catsname = TextEditingController();
    catsnamear = TextEditingController();
    super.onInit();
  }
}
