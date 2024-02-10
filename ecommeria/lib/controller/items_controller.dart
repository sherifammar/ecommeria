import 'package:ecommeria/controller/home_controller.dart';
import 'package:ecommeria/data/datasourse/remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';

import '../core/function/handlingdatacontroller.dart';
import 'package:ecommeria/core/services/servives.dart';

import '../data/datasourse/remote/myfavoriteview.dart';
import '../data/model/itemsmodel.dart';


// abstract class Itemscontroller extends GetxController {
  abstract class Itemscontroller extends  SearchController {
  intialData();
  changeCat(int val, String catid);
  getItems(String categoriesid);
  goToproductdetail(ItemsModel itemsModel);
}

// class ItemscontrollerImp extends SearchController {
  class ItemscontrollerImp extends Itemscontroller  {
  List categories = []; // pass from home controller
  int? selectedCat; // pass from home controller
  String? cat_id; //  usinge in method changecat
  List data = [];
  String? categoriesid; // receive categoriesid  from home controller
  ItemsData itemsdata = ItemsData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();
  MyfavoriteviewData myfavoriteviewdata = MyfavoriteviewData(Get.find()); // can pass data from items to favorite

  //////////////////////////////////////////
  //  String? lang;

  @override
  void onInit() {
    intialData();
    search = TextEditingController(); // from searchcontroller
    // =========== sherif 
    
    
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments["categories"]; // error ==[]
    selectedCat = Get.arguments["selectedCat"];
    categoriesid = Get.arguments["categoriesid"];
    getItems(categoriesid!);
    // run in inital , categoriesid recevice from home controller
    //  lang = myservices.sharedPreferences.getString("lang");
      // deliveryTime();
  
    
  }

  @override
  changeCat(val, catid) {
    // method use change categories on item page

    selectedCat =
        val; // val = i =index of listview = selectedcat"pass from home controller" after click on home page
    cat_id =
        catid; // catid parameter of method = categoriesid "pass from home controller" after click on home page
    getItems(catid);
    update(); // error update ui
  }

  @override
  getItems(categoriesid) async {
    data.clear();
    // clear  data by method changecat
    statusRequest = StatusRequest.loading; // for  loading
    var response = await itemsdata.getData(
        categoriesid, myservices.sharedPreferences.getString("id")!);
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
  goToproductdetail(itemsModel) {
    Get.toNamed("productdetail", arguments: {"itemsmodel": itemsModel});
    // pass data to productdetaill controller" another method transfer data
    //key : value => itemsModel is pass and presnt to productdetail page
  }
}
