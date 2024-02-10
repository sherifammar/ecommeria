
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../controller/orders/orderspendingcontroller.dart';



requestPermissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}
// add this method in controller of main page


fMc() {// send notification where app is openeed
  FirebaseMessaging.onMessage.listen((message) {
    print(" ============================== notification =====");
    print(message.notification!.title); // message from firebase
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();// send sound  . it is package
     Get.snackbar(message.notification!.title!, message.notification!.body!);


    // =============== rececive notification

    refreshPage(message.data);// refresh order page
  });
}

// ====================== rfresh page orders page 
refreshPage(data){ // data  => come from php  and data of fmc method
print("======= pageid");
print(data['pageid']);
print("============== page name");
print(data["pagename"]);
print("============= page route");
print(Get.currentRoute); // give route of curren page

if(Get.currentRoute =="/orders" && data['pagename'] == "orderspending"){
OrderPendingController controller = Get.find();
controller.referhOrder(); // refresh orders page

}


}