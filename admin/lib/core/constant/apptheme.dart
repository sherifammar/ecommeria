import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay", // add font family for all app
 appBarTheme: AppBarTheme(
    color: ColorAPP.primaryColor
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ColorAPP.primaryColor),
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: ColorAPP.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: ColorAPP.black),
      bodyText1: TextStyle(height: 2, color: ColorAPP.grey)),
);

// ===============================
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo", // add font family for all app
  textTheme: const TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: ColorAPP.black),
      headline2: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: ColorAPP.black),
      bodyText1: TextStyle(height: 2, color: ColorAPP.grey)),
);
