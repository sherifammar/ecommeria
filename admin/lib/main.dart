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
//============تم اتعديل main.dart  لاضافة workmanager  1-5-2026- by  gemina 

// import 'package:flutter/material.dart';
// import 'package:workmanager/workmanager.dart';
// import 'package:get/get.dart';

// // 1. دالة المشغل (يجب أن تكون خارج أي كلاس)
// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     try {
//       print("****************  بجأت مهمة الخلفية: $task");

//       // هام جداً: تهيئة التبعيات داخل الـ Isolate المنفصل
//       // يجب وضع الكلاسات التي يحتاجها HomeData ليعمل
//       Get.put(Crud()); 
      
//       HomeData hometdata = HomeData(Get.find());
      
//       // جلب البيانات
//       var response = await hometdata.getData();
//       print("**************** الاستجابة من السيرفر: $response");

//       // معالجة البيانات (تأكد من استيراد دالة handdlingData)
//       var statusRequest = handdlingData(response);

//       if (statusRequest == StatusRequest.success) {
//         if (response['status'] == "success") {
//           print("**************** تم تحديث البيانات بنجاح في الخلفية");
//           // يمكنك هنا إضافة كود لحفظ البيانات في Local Storage (مثل SharedPreferences)
//         }
//       }
      
//       return Future.value(true); // نجاح المهمة
//     } catch (e) {
//       print("**************** خطأ في الخلفية: ${e.toString()}");
//       return Future.value(false); // فشل المهمة (سيحاول النظام إعادة التشغيل لاحقاً)
//     }
//   });
// }

// Future<void> main() async {
//   // التأكد من تهيئة Flutter قبل أي شيء
//   WidgetsFlutterBinding.ensureInitialized(); 

//   // تهيئة خدماتك الخاصة (SharedPrefs, إلخ)
//   await inititalServices(); 

//   // 2. تهيئة Workmanager
//   await Workmanager().initialize(
//     callbackDispatcher,
//     isInDebugMode: true // اجعلها false عند رفع التطبيق للمتجر
//   );

//   // 3. تسجيل المهمة الدورية (تكرار كل ساعة)
//   await Workmanager().registerPeriodicTask(
//     "1", // معرف فريد للمهمة
//     "simplePeriodicTask", 
//     frequency: const Duration(hours: 1),
//     initialDelay: const Duration(minutes: 1),
//     constraints: Constraints(
//       // لا تعمل المهمة إلا في حالة وجود إنترنت
//       networkType: NetworkType.connected,
//     ),
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // التأكد من وضع الكنترولر المسؤول عن اللغة أو الثيم
//     Localcontroller maincontroller = Get.put(Localcontroller());
    
//     return GetMaterialApp(
//       translations: Mytranslation(),
//       debugShowCheckedModeBanner: false,
//       theme: maincontroller.appTheme,
//       getPages: routes,
//       initialBinding: InitialBindings(),
//     );
//   }
// }

//============تم التعدل على كود gemina بواسطه كلود 1-5-

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     try {
//       // ✅ تهيئة Flutter أولاً
//       WidgetsFlutterBinding.ensureInitialized();
      
//       // ✅ تهيئة الخدمات الأساسية فقط (بدون GetX)
//       await inititalServices();
      
//       // ✅ استخدام مباشر بدون GetX
//       final crud = Crud();
//       final homeData = HomeData(crud);
      
//       var response = await homeData.getData();
//       var statusRequest = handdlingData(response);
      
//       if (statusRequest == StatusRequest.success &&
//           response['status'] == "success") {
//         // حفظ البيانات في SharedPreferences مثلاً
//         print("✅ تم التحديث بنجاح");
//       }
      
//       // ✅ تنظيف الموارد
//       crud.dispose(); // إن وُجد
      
//       return true;
//     } catch (e) {
//       print("❌ خطأ: $e");
//       return false;
//     }
//   });
// }