import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archiveorderscontroller.dart';
import '../../../controller/orders/orderspendingcontroller.dart';

import '../../../data/model/ordersmodel.dart';

class CardlistOrdersarchive extends GetView<OrderPendingController> {
  final OrdersModel ordersModel;
  const CardlistOrdersarchive({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
  //  ArchiveOrderscontroller controller = Get.put(ArchiveOrderscontroller());

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Price : ${ordersModel.ordersTotalprice}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Text(Jiffy('${ordersModel.ordersDatetime}', "yy-MM-dd").fromNow(),
                // style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Order TYPE :${controller.ordersType('${ordersModel.ordersType}')}",
            // ),
            // Text(
            //   "Order Price :${ordersModel.ordersPrice} \$",
            // ),
            // Text(
            //   "Delivery Price :${ordersModel.ordersPricedelivery}",
            // ),
            // Text(
            //   "payment method :${controller.paymentMethod('${ordersModel.ordersPaymentmethod}')}",
            // ),
            // Text(
            //   "Status order :${controller.ordersStatus('${ordersModel.ordersStatus}')}",
            // ),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${ordersModel.ordersTotalprice}",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  width: 3,
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/orderdetail",
                        arguments: {"ordersmodel": ordersModel});
                  },
                  child: Text("Detail"),
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 3,
                ),
                MaterialButton(
                  onPressed: () {
                    // ArchiveOrderscontroller archivecontroller =
                    //     Get.put(ArchiveOrderscontroller());
                    // archivecontroller.showRating(
                    //     context, ordersModel.ordersId!);
                  },
                  child: Text("Rating"),
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
