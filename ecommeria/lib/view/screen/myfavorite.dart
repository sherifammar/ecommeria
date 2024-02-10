import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/myfavoriteview_controller.dart';
import '../../core/constant/nameroutes.dart';
import '../widget/home/customappbar.dart';
import '../widget/myfavorite/customlistfavorites.dart';
import '../widget/search.dart';
import 'home.dart';

class Myfavorite extends StatelessWidget {
  const Myfavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteViewController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<MyFavoriteViewController>(
            builder: (controller) => ListView(children: [
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
                  controller.chechSearch(val);
                },
              ),
              HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap:
                              true, // avoid error listview with grideview
                          physics:
                              const NeverScrollableScrollPhysics(), // avoid error listview with grideview
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio:
                                      0.7), //avoid over pix problem
                          itemBuilder: (context, index) {
                            return CustomListFavorite(favoritemodel: controller.data[index], );
                                
                          })
                      : ListitemsSearch(
                          searchItems: controller.
                              listsearchItems, // get data from listsearchitem
                        )),
            ]),
          )),
    );
  }
}
