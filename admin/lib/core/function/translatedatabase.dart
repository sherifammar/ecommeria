
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/servives.dart';

translateDatabase(columar, columen) {
  Myservices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return columar; // go to colum 1
  } else {
    return columen;// go to colum 2
  }
}
