
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/nameroutes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/reporting/deliverycontroller.dart';
import '../../../controller/reporting/users_controller.dart';









class Deliverysetting extends StatelessWidget {
  const Deliverysetting({super.key});

  @override
  Widget build(BuildContext context) {
   Deliverycontroller  controller = Get.put(Deliverycontroller ());
    return Scaffold(appBar:AppBar(title: Text("Delivery Setting"),centerTitle: true,
    ) ,body: ListView(children: [

GridView(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 130),
  physics: NeverScrollableScrollPhysics(),// remove error listview , gridleview
  shrinkWrap: true,
  children: [
    Cardadmin(texttitle: 'Max delivery', imageasset: ImageAsset.deliveryboy,
    onpress: () {
      Get.toNamed(AppRoutes.maxdelivery);
    },),
  //  const  Spacer(),
 Cardadmin(texttitle: 'Approve delivery', imageasset: ImageAsset.deliveryboy, onpress: () {
  
        Get.toNamed(AppRoutes.unapprovedelivery);
  
      }, 
),




],)


    ],),
    );
  }
}
