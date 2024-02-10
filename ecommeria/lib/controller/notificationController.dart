import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/notification_data.dart';

class NotificationController extends GetxController {
  
List data = []; 

  late StatusRequest statusRequest;
    NotificationData notificationdata = NotificationData(Get.find());
   Myservices myservices = Get.find();

getNotification() async {
   
    statusRequest = StatusRequest.loading; // for  loading
    var response = await notificationdata.getData(
         myservices.sharedPreferences.getString("id")!);
    // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // add response(data) in list of categories
        data.addAll(response['data']); // add response(data) in list of data
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

@override
  void onInit() {
  getNotification();
    super.onInit();
  }
}