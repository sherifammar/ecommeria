import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:get/get.dart';

abstract class Scusessresetcontrollercontroller extends GetxController {
  gotoPagelogin();
}

class ScusessresetcontrollercontrollerImp extends Scusessresetcontrollercontroller {
  @override
  gotoPagelogin() {
    Get.offAllNamed(AppRoutes.login);
  }
  
}