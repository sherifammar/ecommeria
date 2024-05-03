
import 'package:get/get.dart';

import '../core/class/crud.dart';
import 'package:workmanager/workmanager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() { // using to make 
    Get.put(Crud());
    
  }
  
}