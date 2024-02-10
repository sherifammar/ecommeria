import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/offerscontroller.dart';
import '../../core/class/handingdataview.dart';

import '../../core/constant/nameroutes.dart';
import '../widget/home/customappbar.dart';

import '../widget/search.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OffersController());
   

    return GetBuilder<OffersController>(
        builder: (controller) => 
        Column(children: [
              Expanded(
                flex: 1,
                child: CustomAppBar(
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
              ),
              !controller.isSearch
                  ? Expanded(
                    flex: 4,
                      child: HandingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Container(
                              child: ListView.builder(
                                  padding: EdgeInsets.all(10),
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, i) {
                                    return InkWell(
                                      onTap: () {
                                        controller.goToproductdetail(
                                            controller.data[i]);
                                      },
                                      child: Card(
                                        color:
                                            Color.fromARGB(255, 247, 216, 117),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                                height: 200,
                                                fit: BoxFit.fill,
                                                imageUrl:
                                                    "http://192.168.1.4/ecommeria/upload/${controller.data[i].itemsImage}"),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "item : ${controller.data[i].itemsName}",
                                                ),
                                                Text(
                                                    "price with discount : ${controller.data[i].itempricediscount}",
                                                    textAlign: TextAlign.start),
                                                Text(
                                                    "des : ${controller.data[i].itemsDesc}",
                                                    textAlign: TextAlign.start),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                                  )
                                  )
                                  )
                  : ListitemsSearch(
                      searchItems: controller
                          .listsearchItems, // get data from listsearchitem
                    )
            ])

        //  =================================================
        // Expanded(
        //     child: HandingDataView(
        //       statusRequest: controller.statusRequest,
        //       widget: ListView.builder(
        //           padding: EdgeInsets.all(10),
        //           // shrinkWrap: true ,
        //           itemCount: controller.data.length,
        //           itemBuilder: (context, i) {
        //             return CustomListItemsoffers(
        //               itemsmodel: controller.data[i],
        //             );
        //           }),
        //     ),
        //   ),
        // );
        // ==============================================================

        );
  }
}
