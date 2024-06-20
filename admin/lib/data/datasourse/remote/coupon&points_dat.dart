import 'dart:io';

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Coupon_pointsData {
  Crud crud;
  Coupon_pointsData(this.crud);

  couponviewData() async {
    var response = await crud.postData(AppLink.couponview, {
     
    }
    ); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  // pointsviewData( String pointsid) async {
  //   var response = await crud.postData(AppLink.pointsview, {
  //     "pointsid" : pointsid , 
  //   }); // {}== map
  //   return response.fold((l) => l, (r) => r); // error => l not 1
  // }

  editeCoupon(Map data) async {
   
     var response = await crud.postData(AppLink.editecoupon, data);
    //  addRequestWithImageOne using for upload file
    // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  // editePoints(Map data) async {
   
  //    var response = await crud.postData(AppLink.editepoints, data);
  //   //  addRequestWithImageOne using for upload file
  //   // {}== map
  //   return response.fold((l) => l, (r) => r); // error => l not 1
  // }

}