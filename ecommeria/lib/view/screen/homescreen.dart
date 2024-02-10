import 'dart:io';

import 'package:ecommeria/controller/homescreen_controller.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/home/bottomnavigationappbarhomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreencontrollerImp());
    return GetBuilder<HomeScreencontrollerImp>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: Icon(Icons.shopping_basket_outlined),
            backgroundColor: ColorAPP.primaryColor, //change color of button
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked, // locat in center
          bottomNavigationBar: bottomNavigationAppBarHomeScreen(),
          body: 
          WillPopScope(
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
