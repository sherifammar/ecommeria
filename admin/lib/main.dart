import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'binding/intialbinding.dart';
import 'core/class/StatusRequest.dart';
import 'core/function/handlingdatacontroller.dart';
import 'core/location/changelocalcontroller.dart';
import 'core/location/translation.dart';
import 'core/services/servives.dart';
import 'data/datasourse/remote/home_data.dart';
import 'route.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() async{
  Workmanager().executeTask((task, inputData) async{
    print("****************  sherif => $task");
      late StatusRequest statusRequest;
    HomeData hometdata = HomeData(Get.find());
     var response = await hometdata
        .getData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
       
       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
     
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // at start run app
   Workmanager().initialize(
    callbackDispatcher, // The top level function, aka callbackDispatcher
    isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  );
    Workmanager().registerPeriodicTask(
    "periodic-task-identifier", 
    "simplePeriodicTask", 
    // When no frequency is provided the default 15 minutes is set.
    // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
  initialDelay: const Duration(minutes: 1) ,
    frequency:const Duration(hours: 1),
    inputData: <String, dynamic>{'key': 'value'},
);
  await inititalServices(); // error add asyn after main // initialservices from service and make shareperence
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localcontroller maincontroller = Get.put(Localcontroller());
    return GetMaterialApp(
      translations: Mytranslation(), // can translation langauge (hve eng word and arabic word)
      debugShowCheckedModeBanner: false,
      // connect to controller of language
      theme: maincontroller.appTheme,
      // home: const Test(),
      // home: const Language(),
      getPages: routes,
      initialBinding: InitialBindings(),
      // routes: routes, // error solved =>routes name of map
    );
  }
}
