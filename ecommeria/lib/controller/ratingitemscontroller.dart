import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/color.dart';
import '../core/constant/imageasset.dart';

import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/ratingitems_data.dart';
import 'package:flutter/material.dart';

import '../data/model/ratingitems/allratingitemsviewmodel.dart';
import '../data/model/ratingitems/ratingitemsviewmodel.dart';

class ratingItemsController extends GetxController {
  Myservices myservices = Get.find();
  late StatusRequest statusRequest;
 
String? itemsid;
  ratingItemsData ratingitemsdata = ratingItemsData(Get.find());

  ratingItemsAddation(
      String itemsid, double ratingitemsrate, String ratingitemscomment) async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await ratingitemsdata.addRatingItems(
        myservices.sharedPreferences.getString("id")!,
        myservices.sharedPreferences.getString("username")!,
        itemsid,
        ratingitemsrate.toString(),
        ratingitemscomment);

    print("**************** $response*********");

    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.defaultDialog(
            title: "wellcome", middleText: "Your comment will study");
      } else {
        statusRequest = StatusRequest.failure; //error in data
      }
    }

    update();
  }

// =================================

  void showRating(BuildContext context, itemsid) {
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) => RatingDialog(
              initialRating: 1.0,
              // your app's name?
              title: const Text(
                'Rating Dialog',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // encourage your user to leave a high rating?
              message: const Text(
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
                ratingItemsAddation(itemsid, response.rating, response.comment);
                print(
                    'rating:${response.rating}, comment: ${response.comment}');
              },
            ));
  }
// ============================

  goToratingdetail(String itemsid) {
    Get.toNamed("ratingdetail", arguments: {"itemsid": itemsid});

  }
}
