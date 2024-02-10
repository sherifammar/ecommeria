import 'package:ecommeria/core/class/StatusRequest.dart';
import 'package:ecommeria/data/datasourse/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/function/handlingdatacontroller.dart';

class Testcontroller extends GetxController {
  TestData testData = TestData(
      Get.find()); // binding and get.find => solve problem of constructure crud
  List data = []; // to save data from response

  late StatusRequest statusRequest; // for error

  getData() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await testData
        .getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess
   
 if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
   
    // if (response['status'] == "success") {
    //   if (StatusRequest.sucess == statusRequest) {
    //     data.addAll(
    //         response['data']); // main if scucess add in reponse in list of data
    //   }
    // } else {
    //   statusRequest = StatusRequest.failure;//error in data
    // }// error from backend in sql database 

    update(); // update ui
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
