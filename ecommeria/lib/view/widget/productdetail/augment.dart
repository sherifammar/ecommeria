
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../controller/augment_controller.dart';
import '../ModelView.dart';

class Augement extends GetView<AugmentController> {
  const Augement({super.key});

  @override
  Widget build(BuildContext context) {
    AugmentController controller = Get.put(AugmentController());
    return Scaffold(
      appBar: AppBar(title: Text("${controller.itemsModel.itemsName}"),centerTitle: true,),
      body:

          // Text("${controller.itemsModel.itemsName}"), for testing
          Container(
        child: ModelView(
          url:
              'http://192.168.1.240/ecommeria/upload/items/${controller.itemsModel.itemsImage.toString()}',
        ),
      ),
    );
  }
}
