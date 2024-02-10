import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/allratingdetailscontroller.dart';


import '../widget/ratingitemsdetail/CustomRatingitemsdetail.dart';


class Ratingitemsdetail extends StatelessWidget {
  const Ratingitemsdetail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllratingDetailController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<AllratingDetailController>(
            builder: (controller) => ListView(children: [
              
              HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: 
                      GridView.builder(
                          shrinkWrap:
                              true, // avoid error listview with grideview
                          physics:
                              const NeverScrollableScrollPhysics(), // avoid error listview with grideview
                          itemCount: controller.allrating.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.7), //avoid over pix problem
                          itemBuilder: (context, index) {
                            return  CustomRatingitemsdetail(allRatingitemsmodel:controller.allrating[index]);
                                
                          })
                      
                        ),
            ]),
          )),
    );
  }
}
