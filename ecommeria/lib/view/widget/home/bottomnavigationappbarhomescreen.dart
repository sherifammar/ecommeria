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
            shape: CircularNotchedRectangle(), // make cricle in bottomappbar
            notchMargin:3, // make margin between float bottom and bottom appbar
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                    controller.listPage.length +1, // built spacer when if listpage=3
                    (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2 ?const Spacer(): // if index = 2 built spacer
                      CustomButtonAppBar(
                          active: controller.currentpage == i// change color 
                              ? true
                              : false, // relpace method
                          icondata: controller.BottomAppBar[i]["icon"],
                          // icondata: '${controller.iconBottomAppBar[i]}',
                          onPressed: () {
                            controller
                                .changePage(i); // change by number of index then change color
                          },
                          textbutton: controller.BottomAppBar[i]["title"] // list of name page"setting
                          );
                })
              ],
            )));
  }
}
