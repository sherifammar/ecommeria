import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/homescreen_controller.dart';
import 'custombottomappbar.dart';


class bottomNavigationAppBarHomeScreen extends StatelessWidget {
  const bottomNavigationAppBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreencontrollerImp>(
        builder: (controller) => BottomAppBar(
             // make margin between float bottom and bottom appbar
            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    controller.listPage.length , // built spacer when if listpage=3
                    (index) {
                 
                  return  
                      CustomButtonAppBar(
                          active: controller.currentpage == index// change color 
                              ? true
                              : false, // relpace method
                          icondata: controller.BottomAppBar[index]["icon"],
                          // icondata: '${controller.iconBottomAppBar[i]}',
                          onPressed: () {
                            controller
                                .changePage(index); // change by number of index then change color
                          },
                          textbutton: controller.BottomAppBar[index]["title"] // list of name page"setting
                          );
                })
              ],
            )));
  }
}
