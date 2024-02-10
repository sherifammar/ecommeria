import 'package:ecommeria/view/screen/home.dart';
import 'package:ecommeria/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/notification.dart';
import '../view/screen/offers.dart';

abstract class HomeScreencontroller extends GetxController {
  changePage(int i);
}

class HomeScreencontrollerImp extends HomeScreencontroller {
  int currentpage = 0;
  String? cat_id;

  List<Widget> listPage = [
    const Homepage(), // first page appear is homepage
    NotificationView(),
    Offers(),
    Setting(), ////
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  List BottomAppBar = [
    {"title": "home", "icon": Icons.home},
    {"title": "Notify", "icon": Icons.notification_add_outlined},
    {"title": "offers", "icon": Icons.person_pin_sharp},
    {"title": "setting", "icon": Icons.settings},
  ];
  // List iconBottomAppBar =["Icons.home","Icons.setting","Icons.profile","Icons.favorites"];
}
