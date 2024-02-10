import 'package:get/get.dart';

import '../data/model/itemsmodel.dart';

class AugmentController extends GetxController {
   late ItemsModel itemsModel;
 
 @override
  void onInit() {
    itemsModel = Get.arguments["itemsmodel"];
    super.onInit();
  }
  
}