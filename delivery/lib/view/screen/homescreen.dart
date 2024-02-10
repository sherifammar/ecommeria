import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';

import '../widget/home/bottomnavigationappbarhomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreencontrollerImp());
    return GetBuilder<HomeScreencontrollerImp>(
      builder: (controller) => Scaffold(
      appBar: AppBar(title: Text("Orders"),centerTitle: true,),
          // locat in center
          bottomNavigationBar: bottomNavigationAppBarHomeScreen(),
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "waen",
                  middleText: "Do You Want Exit from APP",
                  onCancel: () {},
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              }) // method change page . screen is built in body
          ),
    );
  }
}
