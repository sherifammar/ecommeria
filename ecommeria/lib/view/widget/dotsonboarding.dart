import 'package:ecommeria/controller/onboarddotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../data/datasourse/static/static.dart';
class DotControlleronboarding extends StatelessWidget {
  const DotControlleronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // OnboardingDotControllerImp controller = Get.put(OnboardingDotControllerImp());
    return GetBuilder<OnboardingDotControllerImp>(builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          onBoardlist.length,
                          (index) => AnimatedContainer(
                                margin: const EdgeInsets.only(right: 5),
                                duration: const Duration(milliseconds: 900),
                                width: controller.currentPage == index ? 20 :5,//index of list == currentpage to change width and inex =>  width 5
                                height: 6,
                                decoration: BoxDecoration(
                                    // color:controller.currentPage == index ? ColorAPP.primaryColor: Colors.amber,// change color of dotes
                                    color: ColorAPP.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                              )
                              )
                    ],
                  ),);
  }
}