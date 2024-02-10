import 'package:ecommeria/stripe_payment/stripe_keys.dart';
import 'package:ecommeria/test.dart';
import 'package:ecommeria/view/screen/OnBoarding.dart';
import 'package:ecommeria/view/screen/langauge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import 'binding/intialbinding.dart';
import 'core/location/changelocalcontroller.dart';
import 'core/location/translation.dart';
import 'core/services/servives.dart';
import 'route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // at start run app
  await inititalServices(); // error add asyn after main // initialservices from service and make shareperence
   Stripe.publishableKey=ApiKeys.pusblishableKey;
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
