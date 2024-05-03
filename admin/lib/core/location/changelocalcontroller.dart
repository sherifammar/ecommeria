
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../function/fmc.dart';
import '../services/servives.dart';
import 'package:workmanager/workmanager.dart';



class Localcontroller extends GetxController {
  Locale? langauge;
  Myservices myservices =
      Get.find(); // make instance shareprefernce == it is controller
  ThemeData appTheme = themeEnglish; // default theme

  changeLanguage(String langcode) {
    //method of  change language and theme using language screen
    Locale locale = Locale(langcode);
    myservices.sharedPreferences.setString("lang", langcode); // put lang
    appTheme =
        langcode == "ar" ? themeArabic : themeEnglish; // put type of language
    Get.changeTheme(appTheme); // builtin method "changeTheme"
    Get.updateLocale(locale); // builtin method "updateLocale"
  }

  @override
  void onInit() {
    String? sharedpreferncelanguage = myservices.sharedPreferences
        .getString("lang"); // get or fetch type of language
    if (sharedpreferncelanguage == "ar") {
      langauge = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedpreferncelanguage == "en") {
      langauge = const Locale("en");
      appTheme = themeEnglish;
    } else {
      langauge = Locale(Get.deviceLocale!.languageCode); // language of device
      appTheme = themeEnglish;
    }
    // requestPermissionNotification(); // prermission of notification
    // fMc(); // send notification of firebase

    super.onInit();
  }
}
// do not forget add this in main page :
// locale:controller.langauge,
