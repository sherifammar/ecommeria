import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';

import '../../controller/notificationController.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationcontroller =
        Get.put(NotificationController());
    return Container(
        child: GetBuilder<NotificationController>(
      builder: (controller) => HandingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Center(
                    child: Text(
                  "Notification",
                  style: TextStyle(fontSize: 20, color: ColorAPP.primaryColor),
                )),
                ...List.generate(
                    notificationcontroller.data.length,
                    (index) => Container(
                      color: Color.fromARGB(26, 122, 122, 122),
                      padding: EdgeInsets.all(10),
                      child: Stack(children: [
                            Column(children: [
                              Text(notificationcontroller.data[index]
                                  ["notification_title"]!),
                              Text(notificationcontroller.data[index]
                                  ["notification_body"]!),
                              Text('item : ${notificationcontroller.data[index]
                                  ["items_name"]!}'),
                              Text('price : ${notificationcontroller.data[index]
                                  ["itemsprice"]!}'),
                            ]),
                            Positioned(
                                top: 12,
                                right: 10,
                                child: Text(Jiffy(
                                        '${notificationcontroller.data[index]["notification_datetime"]}',
                                        "yy-MM-dd")
                                    .fromNow()))
                          ]),
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    ));
  }
}
