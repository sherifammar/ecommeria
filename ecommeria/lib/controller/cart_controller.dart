// import 'dart:html';
import 'package:ecommeria/core/function/delivertprice.dart';
import 'package:ecommeria/data/datasourse/remote/home_data.dart';
import 'package:ecommeria/data/model/cartmodel.dart';
import 'package:ecommeria/data/model/couponmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/function/deliverytime.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/cart_data.dart';
import 'home_controller.dart';

class CartController extends GetxController {
  CartData cartdata = CartData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  //=================================لاضافه  وقت التوصيل و سعر التوصيل 
 HomeData hometdata = HomeData(Get.find());
  String? timearrive = "";
  String? deliveryPrice;
   List setting = [];
   String settingDelivery = "";

   getdata() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await hometdata
        .getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        
        setting.addAll(response['setting']);
        //=============
               //=================== for wael course
        settingDelivery = setting[0]["setting_deliverytime"]; // for wael course
        myservices.sharedPreferences.setString('delivery', settingDelivery);
        // ===================================  اضاف وقت وصول الطلب و السعر 
        // timearrive = await deliveryTime(
        //         double.parse(setting[0]["setting_startlat"]),
        //         double.parse(setting[0]["setting_long"]),
        //         int.parse(setting[0]["setting_speed"]))
        //     .toString();
        // print(" =================time home page=================");
        // print(timearrive);


        // deliveryPrice = priceOfdelivery(
        //         double.parse(setting[0]["setting_startlat"]),
        //         double.parse(setting[0]["setting_long"]),
        //         int.parse(setting[0]["setting_pricepekilo"]))
        //     .toString();
        // print(deliveryPrice);

        //=================== اضافه سعر من صفحه الهوم 
        deliveryPrice=  int.parse(setting[0]["setting_pricepekilo"]).toString();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }
getTotalConstdeliveryPrice() {
  int shipingprice = int.parse(deliveryPrice!);
    return (priceorder + shipingprice   - priceorder * discountcoupon! / 100);
  }
// getTotalWithdeliveryPrice() {
//   int shipingprice = int.parse(deliveryPrice!);
//     return (priceorder + shipingprice   - priceorder * discountcoupon! / 100);
//   }

//============================================


  //=============================

  List<CartModel> data = [];
  double priceorder = 0.0;
  int totalcountitems = 0;
  int totaldifferentitems = 0;
  TextEditingController? controllercoupon;
  CouponModel? couponmodel;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;

  Map<String, dynamic>? couponList;
  
  addcart(String itemsid) async {
    statusRequest = StatusRequest.loading; // for  loading
    // update();
    var response = await cartdata.addcart(
        myservices.sharedPreferences.getString("id")!,
        itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "note", messageText: Text("sucess to add "));
        // data.addAll(response['data']); // error => must breto remove
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
        // add response(data) // error => must breto remove
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getcartview() async {
    // clear  data by method changecat
    statusRequest = StatusRequest.loading;

    update();

    var response =
        await cartdata.viewcart(myservices.sharedPreferences.getString("id")!);
    // getData for test_data page == it post data to url test

    print(" ============== $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.clear();
        data.addAll(responsedata.map((e) => CartModel.fromJson(e)));
        
        Map responseitemsprice = response["dataprice"]; //dataprice map of php
        priceorder = double.parse(responseitemsprice["totalprice"]); // totalprice map of php
        totalcountitems = int.parse(responseitemsprice["totalitems"]); // totalitems map of php
        totaldifferentitems = int.parse(responseitemsprice["differentitems"]); // differentitems map of php

        // print(data);

        print("carttttt");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  resetVarcart() {
    priceorder = 0.0;
    totalcountitems = 0;
    totaldifferentitems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarcart();
    getcartview();
  }

  getTotalPrice() {
    return (priceorder  - priceorder * discountcoupon! / 100);
  }

  couponView() async {
    statusRequest = StatusRequest.loading;
   

    discountcoupon = 0;
    update();

    var response = await cartdata.coupon(controllercoupon!.text);

    print("=====================  $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> couponList = response["data"];
// convert map to model
        couponmodel = CouponModel.fromJson(couponList);
        discountcoupon = int.parse(couponmodel!.couponDiscount!);
        couponname = couponmodel!.couponName;
        couponid = couponmodel!.couponId;

        print(data);
        print("copoun");
      }
    } else {
      // statusRequest = StatusRequest.failure;
      discountcoupon = 0;
      couponname = null;
      couponid = null;
      Get.snackbar("warm", "coupon invalid");
    }
    update();
  }

  goTocheckout() {
    if (data.isEmpty) {// data of reguest dataprice , dataview
      print(data);

      return Get.snackbar("warn", "empty cart");
    } else {
      Get.toNamed(AppRoutes.checkout, arguments: {
        "couponid": couponid ?? "0",
        "priceorder": priceorder.toString(),
        "discountcoupon": discountcoupon.toString(),
        "shiping":deliveryPrice.toString()
      });
    }
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    getcartview();
    getdata();
    super.onInit();
  }
}
