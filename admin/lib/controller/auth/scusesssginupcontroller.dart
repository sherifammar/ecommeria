
import 'package:get/get.dart';

import '../../core/constant/nameroutes.dart';

abstract class Scusesssginupcontroller extends GetxController {
  gotoPagelogin();
}
class ScusesssginupcontrollerImp extends Scusesssginupcontroller {
  @override
  gotoPagelogin() {
    Get.offAllNamed(AppRoutes.login);
  }
  
}