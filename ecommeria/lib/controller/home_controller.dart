import 'package:ecommeria/core/function/delivertprice.dart';
import 'package:ecommeria/core/services/servives.dart';
import 'package:ecommeria/data/datasourse/remote/home_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/function/deliverytime.dart';
import '../core/function/handlingdatacontroller.dart';
import '../data/model/itemsmodel.dart';

abstract class HomeController extends SearchController {
  initialData();
  getdata();

  goToitems(List categories, int selectedCat, String categoriesid);
}

class HomeControllerImp extends HomeController {
  Myservices myservices = Get.find();
  String? username;
  String? id;
  String? lang;
  late StatusRequest statusRequest;

  List data = [];
  List categories = [];
  List items = [];
  List setting = [];

  String settingrtitle = "";
  String settingbody = "";
  String settingDelivery = "";
  // =======================
  String? timearrive = "";
  String? deliveryPrice;

  // connect o data
  @override
  initialData() {
    username = myservices.sharedPreferences
        .getString("username"); // get username for all app
    id = myservices.sharedPreferences.getString("id"); // save id of user
    lang = myservices.sharedPreferences
        .getString("lang"); // save lang for change desgin of  cart of home page
  }

  HomeData hometdata = HomeData(Get.find());
  @override
  void onInit() {
    initialData();
    getdata();

    search = TextEditingController();
    //send notification
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata
        .getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(
            response['categories']); // add response(data) in list of categories
        items.addAll(response['items']);
        setting.addAll(response['setting']);
        //=============
        settingrtitle =
            setting[0]["setting_title"]; // "setting_title" => name of colum
        settingbody = setting[0]["setting_body"];
        //=================== for wael course
        settingDelivery = setting[0]["setting_deliverytime"]; // for wael course
        myservices.sharedPreferences.setString('delivery', settingDelivery);
        // =================================== اضاف وقت وصول الطلب و السعر 
        timearrive = await deliveryTime(
                double.parse(setting[0]["setting_startlat"]),
                double.parse(setting[0]["setting_long"]),
                int.parse(setting[0]["setting_speed"]))
            .toString();
        print(" =================time home page=================");
        print(timearrive);

        deliveryPrice = priceOfdelivery(
                double.parse(setting[0]["setting_startlat"]),
                double.parse(setting[0]["setting_long"]),
                int.parse(setting[0]["setting_pricepekilo"]))
            .toString();
        print(deliveryPrice);
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
  goToitems(categories, selectedCat, categoriesid) {
    Get.toNamed(AppRoutes.items, arguments: {
      // categories is list ===categories.addAll(response['categories']);
      "categories":
          categories, //==controller.categories"list" come from getdata method
      "selectedCat": selectedCat, //== i
      "categoriesid": categoriesid
    } // pass id of catoriges == categoriesModel.categoriesId!
        );
  }
}

///////////////////////// searchcontroller //////
class SearchController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> listsearchItems = [];
  late StatusRequest statusRequest;
  String? timearrive;

  HomeData hometdata = HomeData(Get.find());

  chechSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none; // can not make load
      isSearch = false; // if field is empty
    }
    update();
  }

  onSearchitems() {
    isSearch = true;
    searchData(); // make search
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

  @override
  void dispose() {
    search?.dispose();
    super.dispose();
  }
}
