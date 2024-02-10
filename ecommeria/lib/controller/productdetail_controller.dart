import 'package:ecommeria/controller/cart_controller.dart';
import 'package:ecommeria/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/class/StatusRequest.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/favorite_data.dart';
import '../data/model/itemsmodel.dart';
import '../data/datasourse/remote/cart_data.dart';

abstract class ProductDetailcontroller extends GetxController {
  intialData();
}

class ProductDetailcontrollerImp extends ProductDetailcontroller {
  // CartController cartcontroller = Get.put(CartController());

  CartData cartdata = CartData(Get.find()); 

  List subItem = [
    {"name": "red", "id": "1", 'active': "0"},
    {"name": "yellow", "id": "2", 'active': "0"},
    {"name": "black", "id": "3", 'active': "1"},
  ];
List data = [];
  late ItemsModel itemsModel; // present in productdetailpage
//  late MyFavoriteModel myFavoritemodel;

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  int CountitemsIncart = 0; // count of ui == 0

  @override
  intialData() async {
    statusRequest = StatusRequest.loading; // take time =>loading
    itemsModel = Get.arguments["itemsmodel"]; // come from items page 
    CountitemsIncart = await getcountitemscart(itemsModel.itemsId!); // get data from cartcontroller
    statusRequest = StatusRequest.success;
  

    update();
  }

  add() {
    addcart(itemsModel.itemsId!);
    CountitemsIncart++;
    update();
    print("okkey++1");
  }

  remove() {
    if (CountitemsIncart > 0) {
      removecart(itemsModel.itemsId!);
      CountitemsIncart--;
      update();
      print("okkey --2 ");
    }
  }


 

  @override
  void onInit() {
    intialData();
  }

////////////////////////////////////// add from sherif /////////////////
  // List data = [];
  // favoriteData favoritedata = favoriteData(Get.find());
 

  // addFavorite(String itemsid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading; // for  loading
  //   var response = await favoritedata.addFavorite(
  //       myservices.sharedPreferences.getString("id")!,
  //       itemsid); // getData for test_data page == it post data to url test

  //   print("**************** $response");
  //   statusRequest = handdlingData(
  //       response); // it give statusrequest error or statusrequest sucess

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(title: "note", messageText: Text("sucess to add "));
  //       data.addAll(response['data']); // add response(data) in list of items
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  // removeFavorite(String itemsid) async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading; // for  loading
  //   var response = await favoritedata.removeFavorite(
  //       myservices.sharedPreferences.getString("id")!,
  //       itemsid); // getData for test_data page == it post data to url test

  //   print("**************** $response");
  //   statusRequest = handdlingData(
  //       response); // it give statusrequest error or statusrequest sucess

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(title: "note", messageText: Text("sucess to remove "));
  //       data.addAll(response['data']); // add response(data) in list of items
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

/////////////////////////////vfrom cartcontroller ///////////////////////
///
///
 addcart(String itemsid) async {
    
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await cartdata.addcart(
        myservices.sharedPreferences.getString("id")!,itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(response);
     // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "note", messageText: Text("sucess to add "));
        // data.addAll(response['data']); // // error => must be to remove
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removecart(String itemsid) async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await cartdata.removecart(
        myservices.sharedPreferences.getString("id")!,
        itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "note", messageText: Text("sucess to remove "));
        // add response(data)  // error => must breto remove
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


 getcountitemscart(String itemsid) async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await cartdata.countItemscart(
        myservices.sharedPreferences.getString("id")!,
        itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countitems = 0;
        countitems = int.parse(response["data"]);
        print("product detail :  => $countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
//============================= sherif ===

   goToAugment(itemsModel) {
    Get.toNamed("augment", arguments: {"itemsmodel": itemsModel});
    // pass data to productdetaill controller" another method transfer data
    //key : value => itemsModel is pass and presnt to productdetail page
  }

  
}

