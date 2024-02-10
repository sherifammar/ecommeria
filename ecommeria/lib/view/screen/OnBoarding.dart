import 'package:ecommeria/controller/onboarddotcontroller.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/view/widget/onboarding/customebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/datasourse/static/static.dart';
import '../widget/dotsonboarding.dart';
import '../widget/onboarding/silderonboarding.dart';

class OnBoarding extends StatelessWidget {
const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(OnboardingDotControllerImp());// due to abstract onboardingdotcontroller
    return Scaffold(
      backgroundColor: ColorAPP.background,
        body: SafeArea(
      // used to delet appbar
      child: Column(
        children: [
          Expanded(
            flex: 3,// expand have flex
            child:const Slideronboarding()
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const DotControlleronboarding(),
                 const CustomButtonOnboarding()
                ],
              ))
        ],
      ),
    ));
  }
}
