import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasourse/remote/catogeries/catogeries_data.dart';
import '../../data/model/categoriesmodel.dart';
import 'catsview_controller.dart';

class Editecatscontroller extends GetxController {
  CategoriesModel?categories; // error 

  CatogeriesData testData = CatogeriesData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none; // for error

  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController catsname;
  late TextEditingController catsnamear;

  editeCats() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading

      update();
      Map data = {
        "categoriesname": catsname.text,
        "categoriesnamear": catsnamear.text,
        "categoriesid":categories!.categoriesId!.toString(),
        "imageold":categories!.categoriesImage!
      };
      var response = await testData.editeCatogeries(data,
          file); // getData for test_data page == it post data to url test

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
    categories = Get.arguments["catsmodel"];
    catsname.text = categories!.categoriesName!;
     catsnamear.text = categories!.categoriesNameAr!;
    super.onInit();
  }

 
}
