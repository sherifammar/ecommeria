
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/constant/nameroutes.dart';
import '../../core/location/changelocalcontroller.dart';
import '../widget/language/costombuttonlanguage.dart';


class Language extends GetView<Localcontroller> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    //  Localcontroller controller = Get.put(Localcontroller());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headline1,
            ), //"1".tr make to dynamic
            const SizedBox(
              height: 15,
            ),
            CustomButtonLanguage(
              onPressed: () {
                controller.changeLanguage("ar"); // using to change languge
                Get.toNamed(AppRoutes.login);
              },
              textOfButton: 'Arabic',
            ),
            CustomButtonLanguage(
              onPressed: () {
                controller.changeLanguage("en");
                Get.toNamed(AppRoutes.login);
              },
              textOfButton: 'English',
            ),
          ],
        ),
      ),
    );
  }
}
