import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reporting/users_controller.dart';
import '../../../core/shared/customecard.dart';

class Maxusers extends StatelessWidget {
  const Maxusers({super.key});

  @override
  Widget build(BuildContext context) {
    Userscontroller controller = Get.put(Userscontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(" Max Users "),
        centerTitle: true,
      ),
      body: GetBuilder<Userscontroller>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Card(
                  child: ListView.builder(
                    itemCount: controller.maxUsersdata.length,
                    itemBuilder: (context, index) => CustomCard(
                      countOforders: '${controller.maxUsersdata[index].count}',
                      id: '${controller.maxUsersdata[index].usersId}',
                      nameusers: '${controller.maxUsersdata[index].usersName}',
                    ),
                  ),
                ),
              )),
    );
  }
}
