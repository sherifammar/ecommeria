import 'package:delivery/core/class/handingdataview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/orders/orderspendingcontroller.dart';
import '../../widget/orders/cardlistorders.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Orderspending extends StatelessWidget {
  const Orderspending({super.key});

  @override
  Widget build(BuildContext context) {
    OrderPendingController controller = Get.put(OrderPendingController());

    return Container(
        child: GetBuilder<OrderPendingController>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      CardlistOrders(ordersModel: controller.data[index]),
                ))));
  }
}
