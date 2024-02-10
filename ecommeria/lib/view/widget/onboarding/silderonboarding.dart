import 'package:ecommeria/controller/onboarddotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasourse/static/static.dart';

class Slideronboarding extends GetView<OnboardingDotControllerImp> {
  // change staless widget to getxview
  const Slideronboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(  // it can move horizantol
      controller: controller.page_controller,
      onPageChanged: (index) {
        controller.onPageChanged(index); // change current page == index
        print(index);
      }, // from onboardingdotcontroller
      itemCount: onBoardlist.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            '${onBoardlist[index].title}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorAPP.black),
          ),
          const SizedBox(
            height: 80,
          ),
          Image.asset('${onBoardlist[index].image}'),
          Container(
            padding: EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            child: Text(
              '${onBoardlist[index].body}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ), // text aligm make text in center
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
