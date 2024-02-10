import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/orders/archiveorderscontroller.dart';

import '../../widget/orders/cardlistorders.dart';



class Archivedelivery extends StatelessWidget {
  const Archivedelivery({super.key});

    @override
  Widget build(BuildContext context) {
   ArchiveOrderscontroller controller = Get.put(ArchiveOrderscontroller());

    return Scaffold(
        appBar: AppBar(
          title:const Text("Archive Orders"),
        ),
        body: Container(
          child: GetBuilder<ArchiveOrderscontroller>(
              builder: (controller) => ListView.builder(
                  itemCount: controller.archivedata.length,
                  itemBuilder: (context, index) =>CardlistOrders(ordersModel: controller.archivedata[index]),
                      ),
        )
        ));
  }
}