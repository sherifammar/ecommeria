import 'package:ecommeria/controller/onboarddotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constant/color.dart';
class CustomButtonOnboarding extends GetView <OnboardingDotControllerImp>{// using getview . it do not change
  const CustomButtonOnboarding ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(// not used scoflod using container 
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(80)),
                    height: 40,
                    margin: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      
                      padding: EdgeInsets.symmetric(horizontal: 90,vertical: 0),// make width of botton
                      color: ColorAPP.primaryColor,
                      textColor: Colors.white,
                      child: Text("continue",style: TextStyle(fontSize: 20),),
                      onPressed: () {controller.next();},// go to next page
                    ),
                  );
  }
}