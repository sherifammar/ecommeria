import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reporting/users_controller.dart';
import '../../../core/shared/customecard.dart';

class Unapproveusers extends StatelessWidget {
  const Unapproveusers({super.key});

  @override
  Widget build(BuildContext context) {
    Userscontroller controller = Get.put(Userscontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(" Unapprove Users "),
        centerTitle: true,
      ),
      body: GetBuilder<Userscontroller>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Card(
                  child: ListView.builder(
                    itemCount: controller.Data.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.approveUsers(controller.Data[index].usersId!);
                      },
                      child: CustomCard(
                        countOforders: 'Need to approve',
                        id: '${controller.Data[index].usersId}',
                        nameusers: '${controller.Data[index].usersName}',
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}