// import 'dart:html';
import 'package:ecommeria/data/model/cartmodel.dart';
import 'package:ecommeria/data/model/couponmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/cart_data.dart';

class CartController extends GetxController {
  CartData cartdata = CartData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

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
    return (priceorder - priceorder * discountcoupon! / 100);
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
        "discountcoupon": discountcoupon.toString()
      });
    }
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    getcartview();
    super.onInit();
  }
}
