
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/nameroutes.dart';
Future<bool>alertAddAddress(){
 Get.defaultDialog(title: " Warn",middleText: "If you want make order . you must be add address",
actions:[
ElevatedButton(onPressed: (){
  Get.toNamed(AppRoutes.addaddress);// shutdow app
}, child: Text("confirm")),
ElevatedButton(onPressed: (){
   Get.toNamed(AppRoutes.home);// return to back app
}, child: Text("cancal")),

] );

return Future.value(true);


}