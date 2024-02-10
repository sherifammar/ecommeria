import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  // using get service
  late SharedPreferences sharedPreferences; // make instance from sharepersence
  Future<Myservices> init() async {
    await Firebase.initializeApp(); // start at init
    sharedPreferences =
        await SharedPreferences.getInstance(); // make shareperefnce
    return this; // return init method
  }
} // end of class myservice

inititalServices() async {
  await Get.putAsync(() => Myservices().init());
  // using putasyn due to asyn and await
  // inject myservice  method
}

// make shareperfence for app
// do not forget add in main page this :
//  WidgetsFlutterBinding.ensureInitialized(); // at start run app
//   await inititalServices();
