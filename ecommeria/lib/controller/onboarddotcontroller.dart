import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:ecommeria/core/services/servives.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datasourse/static/static.dart';

abstract class OnboardingDotController extends GetxController {
  next();
  onPageChanged(int index);// fetch number of page == current page
}

class OnboardingDotControllerImp extends OnboardingDotController {
  int currentPage = 0;
  late PageController page_controller; // controller page
  Myservices myservices =Get.find();

  //===============================
  @override
  next() {

// method for change page
    if (page_controller.hasClients) {
      currentPage++; // increase number of page 
      if (currentPage > onBoardlist.length - 1)
       {// when go to last page (4) transfer to login page
       myservices.sharedPreferences.setString("step", "1");// save in sharerefence وضع 1 فى الذاكره لعدم العوده اللا onboarding
        Get.offAllNamed(AppRoutes.login);
        print("page 4");
      } else {
        page_controller.animateToPage(currentPage, // transfer to next page with animation
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    }
  }

  @override
  onPageChanged(int index) { // change index
    currentPage = index; // fetch number of page == current page
    update(); // change on ui view
  }
// == for sherif => quran ==
// showepage(int index){
// myservices.sharedPreferences.getString(index.toString());
// // add in onPageChanged Slideronboarding 
// }

// saveepage(int index){
// myservices.sharedPreferences.setString('page',index.toString());
// // add in button of save
// }
//=================
  @override
  void onInit() {
    page_controller = PageController();
    super.onInit();
  }
}
