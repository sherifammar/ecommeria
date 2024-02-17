// import 'dart:html';


import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../controller/home_controller.dart';
import '../../core/class/handingdataview.dart';

import '../widget/home/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemshome.dart';
import '../widget/search.dart';

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
                CustomAppBar(
                  titleappbar: "Find Product",
             
                  onPressedSearch: () {
                    controller.onSearchitems();
                    
                  },
                  onPressedfavorite: () {
                    Get.toNamed(AppRoutes.myfavorite);
                  },
                  mycontroller: controller.search!,
                  myonChanged: (val) {
                    controller.chechSearch(val); // for change of field of textfield
                      controller.onSearchitems();
                  },
                ),
                HandingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch ?
                     Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              // if(controller.setting.isEmpty)
                              CustomCardHome(
                                  title:' ${controller.settingrtitle}',
                                  body: controller.settingbody),
                              CustomTitleHome(title: "Categories"),
                              ListCategoriesHome(),
                              CustomTitleHome(title: "Product for you"),
                              ListItemsHome(),
                              CustomTitleHome(title: "Top Selling with Discount"),
                              ListItemsHome()
                            ],
                          )
                        : ListitemsSearch(
                            searchItems: controller
                                .listsearchItems, // get data from listsearchitem
                          )
                          )
              ],
            )
            )
            );
  }
}

