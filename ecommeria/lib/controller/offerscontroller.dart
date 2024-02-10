import 'package:ecommeria/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/function/handlingdatacontroller.dart';

import '../data/datasourse/remote/home_data.dart';
import '../data/datasourse/remote/offers_data.dart';
import 'home_controller.dart';

class OffersController extends SearchController {
  List<ItemsModel> data = [];

  HomeControllerImp homecontroller = Get.put(HomeControllerImp());
  late StatusRequest statusRequest;
  offersData offerdata = offersData(Get.find());

  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offerdata.getOffersData();

    print("**************** $response");
    statusRequest = handdlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  goToproductdetail(itemsModel) {
    Get.toNamed("productdetail", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    getOffers();
    search = TextEditingController();
    super.onInit();
  }
}

//  ==============================================

class SearchController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> listsearchItems = [];
  late StatusRequest statusRequest;

  HomeData hometdata = HomeData(Get.find());

  chechSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchitems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata.searchData(
        search!.text); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listsearchItems.clear();
        List responsedata = response["data"];

        listsearchItems.addAll(responsedata.map((e) =>
            ItemsModel.fromJson(e))); // add response(data) in list of items
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  searchMyfavorite(String searchname) async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata.searchData(
        searchname); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listsearchItems.clear();
        List responsedata = response["data"];

        listsearchItems.addAll(responsedata.map((e) =>
            ItemsModel.fromJson(e))); // add response(data) in list of items
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  searchOffesrs(String searchname) async {
    isSearch = true;
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata.searchData(
        searchname); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listsearchItems.clear();
        List responsedata = response["data"];

        listsearchItems.addAll(responsedata.map((e) =>
            ItemsModel.fromJson(e))); // add response(data) in list of items
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }
}
