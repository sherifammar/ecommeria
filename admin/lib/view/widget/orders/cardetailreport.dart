import 'package:admin/data/model/winadminmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orderspendingcontroller.dart';

import '../../../controller/reporting/reportingcontroller.dart';
import '../../../data/model/adminreportmodels.dart';

class CardDetailReport extends GetView<OrderPendingController> {
  final AdminReportModels adminmodel;
  const CardDetailReport({super.key, required this.adminmodel});

  @override
  Widget build(BuildContext context) {
    Get.put(Reportingcontroller());

    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Price : ${adminmodel.ordersTotalprice}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "price delivery :${adminmodel.ordersPricedelivery}",
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "coupon :${adminmodel.ordersCoupon}",
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Discount:${adminmodel.itemsDiscount}",
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "count items :${adminmodel.countitems}",
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "date :${adminmodel.ordersDate}",
               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
