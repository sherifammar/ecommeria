// import 'dart:html';



import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../controller/home_controller.dart';
import '../../core/class/handingdataview.dart';





class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
   HomeControllerImp controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                
                HandingDataView(
                    statusRequest: controller.statusRequest,
                    widget: 
                     Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                            
                            ],
                          )
                        
                          )
              ],
            )));
  }
}

