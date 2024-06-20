// import 'dart:html';

import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/nameroutes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home "),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 130),
            physics:
                NeverScrollableScrollPhysics(), // remove error listview , gridleview
            shrinkWrap: true,
            children: [
              Cardadmin(
                texttitle: 'Catogeries',
                imageasset: ImageAsset.catogeries,
                onpress: () {
                  Get.toNamed(AppRoutes.catogeriesview);
                },
              ),
              Cardadmin(
                texttitle: 'Items',
                imageasset: ImageAsset.deliverytruck,
                onpress: () {
                  Get.toNamed(AppRoutes.itemsview);
                },
              ),
              Cardadmin(
                texttitle: 'Message',
                imageasset: ImageAsset.messageicon,
                onpress: () {
                  Get.toNamed(AppRoutes.message);
                },
              ),
              Cardadmin(
                  texttitle: 'Orders',
                  imageasset: ImageAsset.delivery,
                  onpress: () {
                    Get.toNamed(AppRoutes.orderscreen);
                  }),
              Cardadmin(
                texttitle: 'Reports',
                imageasset: ImageAsset.report,
                onpress: () {
                  Get.toNamed(AppRoutes.reporting);
                },
              ),
              Cardadmin(
                texttitle: 'Users',
                imageasset: ImageAsset.users,
                onpress: () {
                  Get.toNamed(AppRoutes.userssetting);
                },
              ),
              Cardadmin(
                texttitle: 'Delivery',
                imageasset: ImageAsset.deliveryboy,
                onpress: () {
                  Get.toNamed(AppRoutes.deliverysetting);
                },
              ),
               Cardadmin(
                texttitle: 'setting',
                imageasset: ImageAsset.setting,
                onpress: () {
                  Get.toNamed(AppRoutes.addaddress);
                },
              ),
                   Cardadmin(
                texttitle: 'points',
                imageasset: ImageAsset.onboardingimagefour,
                onpress: () {
                  Get.toNamed(AppRoutes.points);
                },
              ),
                Cardadmin(
                texttitle: 'coupon',
                imageasset: ImageAsset.logonsignin,
                onpress: () {
                  Get.toNamed(AppRoutes.coupon);
                },
              ),

              Cardadmin(
                  texttitle: 'exit',
                  imageasset: ImageAsset.exit,
                  onpress: () {
                    controller.logout();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
