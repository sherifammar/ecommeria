import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';
import '../../data/datasourse/remote/orders/archive_data.dart';

import '../../data/model/ordersmodel.dart';

class ArchiveOrderscontroller extends GetxController {
   List<OrdersModel> archivedata = []; // to save data from response

  late StatusRequest statusRequest;
  Archive archive = Archive(Get.find());
  Myservices myservices = Get.find();
 getArchiveOrders() async {
    archivedata.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await archive.archiveData(myservices.sharedPreferences
        .getString(
            "id")!); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        archivedata.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }
 // ================================================ 
  rating( String ordersid ,double ordersrating , String ordersnotrating) async {
   
      statusRequest = StatusRequest.loading; // for  loading
      update();
      var response = await archive.ratingDaligo(ordersid ,ordersrating.toString(), ordersnotrating);

      print("**************** $response*********");

      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.home);
           Get.defaultDialog(
              title: "wellcome", middleText: "Your comment will study");
        } else {
          
          statusRequest = StatusRequest.failure; //error in data
          
        }
      }

      update();
      }

// =================================
  
void showRating(BuildContext context , ordersid){
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) =>  RatingDialog(
  
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message:const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(ImageAsset.logonsignin),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(color: ColorAPP.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
       rating(ordersid ,response.rating ,response.comment);
        print('rating: ${response.rating}, comment: ${response.comment}');
      
      },
    )
    );
  @override
  void onInit() {
 getArchiveOrders();     
    super.onInit();
  }
}}




 