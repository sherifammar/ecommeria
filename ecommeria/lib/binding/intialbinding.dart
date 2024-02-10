import 'package:ecommeria/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() { // using to make 
    Get.put(Crud());
  }
  
}