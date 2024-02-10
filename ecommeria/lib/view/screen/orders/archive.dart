import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/orders/archiveorderscontroller.dart';

import '../../widget/orders/cardlistorders.dart';
import '../../widget/orders/cardlistordersarchive.dart';


class Archive extends StatelessWidget {
  const Archive({super.key});

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
                  itemBuilder: (context, index) =>CardlistOrdersarchive(ordersModel: controller.archivedata[index]),
                      ),
        )
        ));
  }
}