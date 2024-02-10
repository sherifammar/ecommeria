
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool>alertExitAPP(){
 Get.defaultDialog(title: "تنبيه",middleText: "هل توريد الخروج من التطبيق",
actions:[
ElevatedButton(onPressed: (){
  exit(0);// shutdow app
}, child: Text("confirm")),
ElevatedButton(onPressed: (){
  Get.back();// return to back app
}, child: Text("cancal")),

] );

return Future.value(true);


}