
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/orders/acceptecontroller.dart';
import '../../../core/class/handingdataview.dart';
import '../../widget/orders/cardlistorders.dart';

class Orderaccept extends StatelessWidget {
  const Orderaccept({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAcceptController controller = Get.put(ViewAcceptController());

    return Container(
        child: GetBuilder<ViewAcceptController>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      CardlistOrders(ordersModel: controller.data[index]),
                ))));
  }
}
