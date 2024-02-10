import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:get/get.dart';

abstract class Scusesssginupcontroller extends GetxController {
  gotoPagelogin();
}
class ScusesssginupcontrollerImp extends Scusesssginupcontroller {
  @override
  gotoPagelogin() {
    Get.offAllNamed(AppRoutes.login);
  }
  
}