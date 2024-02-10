
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../view/screen/orders/orderaccept.dart';
import '../view/screen/orders/orderspending.dart';
import '../view/screen/setting.dart';


abstract class HomeScreencontroller extends GetxController {
  changePage(int i);
}

class HomeScreencontrollerImp extends HomeScreencontroller {
  int currentpage = 0;
  String? cat_id;

  List<Widget> listPage = [
    const Orderspending(), // first page appear is homepage
Orderaccept(),
   Setting()

  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  List BottomAppBar = [
    {"title": "Orders pending", "icon": Icons.home},
    
    {"title": "Approved", "icon": Icons.approval_sharp},
    {"title": "Setting", "icon": Icons.settings},
  ];
  // List iconBottomAppBar =["Icons.home","Icons.setting","Icons.profile","Icons.favorites"];
}
