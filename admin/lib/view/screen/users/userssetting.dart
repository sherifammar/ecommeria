
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/nameroutes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/reporting/users_controller.dart';









class Userssetting extends StatelessWidget {
  const Userssetting({super.key});

  @override
  Widget build(BuildContext context) {
   Userscontroller controller = Get.put(Userscontroller());
    return Scaffold(appBar:AppBar(title: Text("User Setting"),centerTitle: true,
    ) ,body: ListView(children: [

GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 130),
  physics: NeverScrollableScrollPhysics(),// remove error listview , gridleview
  shrinkWrap: true,
  children: [
    Cardadmin(texttitle: 'Max users', imageasset: ImageAsset.avatar,
    onpress: () {
      Get.toNamed(AppRoutes.maxusers);
    },),

Cardadmin(texttitle: 'Approve users', imageasset: ImageAsset.approveusers, onpress: () {
      Get.toNamed(AppRoutes.unapproveusers);
    }, ),




],)


    ],),
    );
  }
}
