
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../core/class/StatusRequest.dart';
import '../core/constant/nameroutes.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/coupon&points_dat.dart';
import '../data/model/couponmodel.dart';


class CouponAndPointsController extends GetxController {
  
Coupon_pointsData testData = Coupon_pointsData (Get.find());

  StatusRequest? statusRequest = StatusRequest.none; // for error

  Myservices myservices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController couponname;
  late TextEditingController couponcount;
  late TextEditingController coupondiscount;
  late TextEditingController couponexpiredate;
  List<CouponMpdels>coupondata=[];
  //  List<PointsModels>pointsdata=[];
    GlobalKey<FormState> formState1 = GlobalKey<FormState>();

  late TextEditingController pointsscore;
  late TextEditingController pointsdiscount;
  late TextEditingController pointsexpiredate;

String?  textpointsscore ;
 String? textpointsdiscount ;
           

DateTime dateTime = DateTime.now();
String? expiredatecoupon;

  chooseCouponexpiredate(String val) {
    expiredatecoupon = val;
    update();
    print(' coupon date ==> ${val}');
  }

  String? expiredatepoint;

  choosePointsexpiredate(String val) {
    expiredatepoint = val;
    update();
    print(' point date ==> ${val}');
  }

  editeCoupon() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading

      update();
      Map data = {
        "couponname": couponname.text,
        "couponcount": couponcount.text,
        "coupondiscount": coupondiscount.text,
         "couponexpiredate":expiredatecoupon.toString(),
        
             
      };
      var response = await testData.editeCoupon(
          data); // getData for test_data page == it post data to url test

      print("****************coupon controller:   $response");
      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.home);
         
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update(); // update ui
    }
  }

  couponviewdata() async {
    statusRequest = StatusRequest.loading; // for  loading
    var response = await testData.couponviewData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
       coupondata
            .addAll(responsedata.map((e) => CouponMpdels.fromJson(e)));
            // textpointsscore=pointsdata[0].pointsScore;
            // textpointsdiscount=pointsdata[0].pointsDiscount ;
       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }
  //================================
//  pointviewdata() async {
//     statusRequest = StatusRequest.loading; // for  loading
//     var response = await testData.pointsviewData(myservices.sharedPreferences.getString("id")!); // getData for test_data page == it post data to url test

//     print("**************** $response");
//     statusRequest = handdlingData(
//         response); // it give statusrequest error or statusrequest sucess

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         List responsedata = response['data'];
//         // to save data from response
//        pointsdata
//             .addAll(responsedata.map((e) => PointsModels.fromJson(e)));
       
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }

//     update(); // update ui
//   }

//    editePoints() async {
//     if (formState1.currentState!.validate()) {
//       statusRequest = StatusRequest.loading; // for  loading

//       update();
//       Map data = {
//         "pointsscore": pointsscore.text,
//         "pointsdiscount": pointsdiscount.text,
//          "pointsexpiredate":expiredatepoint.toString(),
//          "pointsowneritemsid":myservices.sharedPreferences.getString("id"),
             
//       };
//       var response = await testData.editePoints(
//           data); // getData for test_data page == it post data to url test

//       print("****************coupon controller:   $response");
//       statusRequest = handdlingData(
//           response); // it give statusrequest error or statusrequest sucess

//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           Get.offNamed(AppRoutes.home);
         
//         } else {
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update(); // update ui
//     }
//   }
  @override
  void onInit() {
    couponname = TextEditingController();
    couponcount = TextEditingController();
    coupondiscount = TextEditingController();
    couponexpiredate = TextEditingController();

   

    pointsscore = TextEditingController();
    pointsdiscount = TextEditingController();
    pointsexpiredate = TextEditingController();
 

    // pointviewdata();
    couponviewdata();
  
   
    super.onInit();
  }
}