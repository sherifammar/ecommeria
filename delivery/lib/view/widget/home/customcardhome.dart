

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: ColorAPP.primaryColor,// can not use out decoration
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title, // form constructure
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
        ),
        Positioned(
          top: -60,
          right: controller.lang =="en"?-60 :null,// if conition => change according language
          left: controller.lang =="ar"?-60 :null,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: ColorAPP.secoandColor,
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
