import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/core/services/servives.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get Priority => 1;
  Myservices myservices = Get.find(); // for share refence and start firebase

  @override
  RouteSettings? redirect(String? route) { // it can go to page
    if (myservices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.home); // if middle ware ==2 => go to homepage
    }

    if (myservices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(
          name: AppRoutes.login); // لو يوجد اونبورد ==1 اذهب الى لوجن
    }

    return null;
  }
}
