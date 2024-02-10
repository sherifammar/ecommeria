
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';

import '../../data/datasourse/remote/orders/archive_data.dart';
import '../../data/datasourse/remote/orders/viewpending_data.dart';
import '../../data/model/ordersmodel.dart';

class OrderPendingController extends GetxController {
  List<OrdersModel> data = []; // to save data from response
List<OrdersModel> archivedata = []; // to save data from response

  late StatusRequest statusRequest;
  Archivedata archive = Archivedata(Get.find());
ViewapprovePending  ordersPending = ViewapprovePending (Get.find());
  Myservices myservices = Get.find();

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await ordersPending. getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }



//===================
  String ordersType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String paymentMethod(String val) {
    if (val == "0") {
      return "cash";
    } else {
      return "payment card";
    }
  }

  String ordersStatus(String val) {
    if (val == "0") {
      return " wait to approve";
    } else if (val == "1") {
      return " order approve ";
    } else if (val == "2") {
      return "Ready to picked up by delivery";
    } else if(val == "3")
    {
      return "On Way";
     }
      return "archive";
    
  }

  referhOrder() {
    getOrders();
  }

   approveOrder(ordersid, usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await ordersPending. approeOrder(
      ordersid,
       usersid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
         getOrders();
        print(" approve order delivery ");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }


 
  @override
  void onInit() {
    getOrders();

    // TODO: implement onInit
    super.onInit();
  }
}
