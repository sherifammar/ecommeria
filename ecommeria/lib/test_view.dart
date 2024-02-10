import 'package:ecommeria/controller/test_controller.dart';
import 'package:ecommeria/core/class/StatusRequest.dart';
import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Testview extends StatelessWidget {
  const Testview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("test view"),
      ),
      body: GetBuilder<Testcontroller>(builder: (controller) {
        return HandingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}"); //data is list
                }));
      }),
    );
  }
}
