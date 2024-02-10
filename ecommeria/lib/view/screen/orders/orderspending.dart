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

    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: Container(
          child: GetBuilder<OrderPendingController>(
              builder: (controller) => ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        // direction: DismissDirection.startToEnd,
                        onDismissed: (direction) {
                          
                       controller.deletOrders(controller.data[index].ordersId!);
                        },
                        child:
                            CardlistOrders(ordersModel: controller.data[index]),
                      ))),
        ));
  }
}
