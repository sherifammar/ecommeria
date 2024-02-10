// import 'dart:html';
import 'package:ecommeria/controller/home_controller.dart';
import 'package:ecommeria/data/model/itemsmodel.dart';
import 'package:ecommeria/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';

import '../data/datasourse/remote/myfavoriteview.dart';

class MyFavoriteViewController extends SearchController {
  MyfavoriteviewData myfavoriteviewdata =
      MyfavoriteviewData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  List<MyFavoriteModel> data = []; // third method
  List itemsdata=[];

  Map isFavorite = {};
  setFavorite(id, val) {
    // id key of map = val =>value of map

    isFavorite[id] = val;
    update();
  }

  getData() async {
  update();
    statusRequest = StatusRequest.loading; // for  loading
    var response = await myfavoriteviewdata.getData(myservices.sharedPreferences
        .getString(
            "id")!); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletFromfavorite(String myfavoriteid) {
    var response = myfavoriteviewdata.deletData(
        myfavoriteid); // getData for test_data page == it post data to url test

    data.removeWhere((element) =>
        element.favoriteId ==
        myfavoriteid); // remove from list of data (ui view)

    update();
  }

  goToproductdetail() {
    Get.toNamed("home");
  }

// =====================================================================

  @override
  void onInit() {
    getData();
    search = TextEditingController();
  
    super.onInit();
  }


}
