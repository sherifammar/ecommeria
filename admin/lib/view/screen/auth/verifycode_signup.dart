
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/location/changelocalcontroller.dart';
import '../../../controller/auth/verifycode_Sginupcontroller.dart';
import '../../../core/class/handingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customTextauth.dart';

class Verifycode_sginup extends StatelessWidget {
  const Verifycode_sginup({super.key});

  @override
  Widget build(BuildContext context) {
    Verifycode_sginupcontrollerImp Verifycode_sginup_controller =
        Get.put(Verifycode_sginupcontrollerImp());
    Localcontroller controller = Get.put(
        Localcontroller()); // do not forget to add controller to change language
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorAPP.background,
          elevation: 0.0,
          title: Text("vertication code",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: ColorAPP.grey)),
        ),
        body: GetBuilder<Verifycode_sginupcontrollerImp>(
            builder: (controller) => HandingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget:  Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            const CustomTextauth(text: "check code"),
                            const SizedBox(height: 20),
                            CustomTextauth(
                                text: "we send verify code on ${controller.email} "),
                            const SizedBox(height: 20),
                            OtpTextField(// package 
                              borderRadius: BorderRadius.circular(25),
                              fieldWidth: 40,
                              numberOfFields: 5,
                              borderColor: Color(0xFF512DA8),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                Verifycode_sginup_controller.gotoscuss_sginup(
                                    verificationCode); // // verifycodesignup == verificationCode
                              }, // end onSubmit
                            ),
                            InkWell(onTap: (){controller.reSend();},
                           child:Center(child: Text("Resend ",style: TextStyle(fontSize:20, fontWeight: FontWeight.bold ),),),),
                          ]),
                        ),
                )));
  }
}
