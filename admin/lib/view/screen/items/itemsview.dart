import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/itemscontroller/itemsview_controller.dart';
import '../../../linkapi.dart';

class Itemsview extends StatelessWidget {
  const Itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsViewcontroller controller = Get.put(ItemsViewcontroller());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToadditems();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Items"),
        ),
        body: GetBuilder<ItemsViewcontroller>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                      onWillPop: () {
                        return controller.goToback();
                      },
                      child: Container(
                          child: ListView.builder(
                              padding: EdgeInsets.all(10),
                              itemCount: controller.data.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Color.fromARGB(255, 252, 251, 250),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CachedNetworkImage(
                                              height: 200,
                                              fit: BoxFit.fill,
                                              imageUrl:
                                                  "${AppLink.imagelink}/items/${controller.data[i].itemsImage}"),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "item : ${controller.data[i].itemsName}",
                                            ),
                                            Text(
                                                "price with discount : ${controller.data[i].itemsDiscount}",
                                                textAlign: TextAlign.start),
                                            Text(
                                                "des : ${controller.data[i].itemsDesc}",
                                                textAlign: TextAlign.start),
                                            Text(
                                                "Count : ${controller.data[i].itemsCount}",
                                                textAlign: TextAlign.start),
                                            Text(
                                                "Active : ${controller.data[i].itemsActive}",
                                                textAlign: TextAlign.start),
                                            Text(
                                                "Catogeries name : ${controller.data[i].categoriesName}",
                                                textAlign: TextAlign.start),
                                            Text(
                                                "Date : ${controller.data[i].itemsDate}",
                                                textAlign: TextAlign.start),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Get.defaultDialog(
                                                        title: "warn",
                                                        middleText:
                                                            "You Want Delet categories",
                                                        onCancel: () {},
                                                        onConfirm: () {
                                                          controller.deletItems(
                                                              controller.data[i]
                                                                  .itemsId!,
                                                              controller.data[i]
                                                                  .itemsImage!);
                                                          Get.back(); // delet default dialog
                                                        });
                                                  },
                                                  icon: Icon(Icons
                                                      .delete_forever_outlined),
                                                  iconSize: 30,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller.goToedite(
                                                        controller.data[i]);
                                                  },
                                                  icon: Icon(
                                                      Icons.edit_note_outlined),
                                                  iconSize: 30,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }))),
                )));
  }
}
