import 'package:delivery/core/class/handingdataview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/orders/acceptecontroller.dart';
import '../../widget/orders/cardlistorders.dart';

class Orderaccept extends StatelessWidget {
  const Orderaccept({super.key});

  @override
  Widget build(BuildContext context) {
    AcceptController controller = Get.put(AcceptController());

    return Container(
        child: GetBuilder<AcceptController>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      CardlistOrders(ordersModel: controller.data[index]),
                ))));
  }
}
