// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  favoriteData favoritedata = favoriteData(Get.find()); // connect to data
  late StatusRequest statusRequest;
  Myservices myservices = Get.find();
  List data = [];

  Map isFavorite = {};
  setFavorite(id, val) {
    // id key of map = val =>value of map
    // addation to map isfavorite

    isFavorite[id] = val;
    update();
  }

  addFavorite( String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    var response = await favoritedata.addFavorite(
        myservices.sharedPreferences.getString("id")!,
        itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "note", messageText: Text("sucess to add "));
        data.addAll(response['data']); // add response(data) in list of items
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite( String itemsid) async {
    // data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    var response = await favoritedata.removeFavorite(
        myservices.sharedPreferences.getString("id")!,
        itemsid); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "note", messageText: Text("sucess to remove "));
        data.addAll(response['data']); // add response(data) in list of items
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
