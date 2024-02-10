
import 'package:admin/view/screen/orders/archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../data/datasourse/remote/orders/archive_data.dart';
import '../../view/screen/orders/orderaccept.dart';
import '../../view/screen/orders/orderspending.dart';


abstract class OrdersScreencontroller extends GetxController {
  changePage(int i);
}

class OrdersScreencontrollerImp extends OrdersScreencontroller {
  int currentpage = 0;
  String? cat_id;

  List<Widget> listPage = [
    const Orderspending(), // first page appear is homepage
     const Orderaccept(),
      const Archive()


  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  List BottomAppBar = [
    {"title": "Orders pending", "icon": Icons.home},
    
    {"title": "Approved", "icon": Icons.approval_sharp},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];
  // List iconBottomAppBar =["Icons.home","Icons.setting","Icons.profile","Icons.favorites"];
}
