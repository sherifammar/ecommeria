import 'package:ecommeria/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/auth/scusesssginupcontroller.dart';
import '../../widget/auth/Custombuttomauth.dart';

class Scusesssginup extends StatelessWidget {
  const Scusesssginup({super.key});

  @override
  Widget build(BuildContext context) {
   ScusesssginupcontrollerImp scusesssignupcontroller = Get.put(ScusesssginupcontrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorAPP.background,
        elevation: 0.0,
        title: Text("scusees ",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: ColorAPP.grey)),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: ColorAPP.primaryColor,
              ),
               
            ),
            Text("scusesss"),
            SizedBox(height: 50),
            Container(child:  CustomButtomauth(text: "go to login", onPressed: () {scusesssignupcontroller.gotoPagelogin();}),)
          ],
       
        ),
      ),
    );
  }
}
