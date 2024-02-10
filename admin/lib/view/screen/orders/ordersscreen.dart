import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/ordersscreen_controller.dart';
import '../../widget/home/bottomnavigationappbarhomescreen.dart';


class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersScreencontrollerImp());
    return GetBuilder<OrdersScreencontrollerImp>(
      builder: (controller) => Scaffold(
      appBar: AppBar(title: Text("Home"),centerTitle: true,),
          // locat in center
          bottomNavigationBar: bottomNavigationAppBarHomeScreen(),
          body:  controller.listPage.elementAt(controller.currentpage),
              
              
               // method change page . screen is built in body
          ),
    );
  }
}
