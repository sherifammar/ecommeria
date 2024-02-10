
import 'package:get/get.dart';

import '../../core/constant/nameroutes.dart';

abstract class Scusessresetcontrollercontroller extends GetxController {
  gotoPagelogin();
}

class ScusessresetcontrollercontrollerImp extends Scusessresetcontrollercontroller {
  @override
  gotoPagelogin() {
    Get.offAllNamed(AppRoutes.login);
  }
  
}