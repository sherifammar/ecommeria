import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/view/widget/auth/customTextauth.dart';
import 'package:ecommeria/view/widget/auth/customTextbodyauth.dart';
import 'package:ecommeria/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/verifycode_controller.dart';
import '../../../../core/location/changelocalcontroller.dart';
import '../../../widget/auth/Custombuttomauth.dart';
import '../../../widget/auth/customtextsignuporsginin.dart';
import '../../../widget/auth/logoimage.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodecontrollerImp Verifycode_controller =
        Get.put(VerifyCodecontrollerImp());
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextauth(text: "check code"),
          const SizedBox(height: 20),
          const CustomTextauth(text: "we send verify code on email "),
          const SizedBox(height: 20),
          OtpTextField(
            borderRadius: BorderRadius.circular(25), fieldWidth: 40,
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
              Verifycode_controller.gotoresetpassword(verificationCode);
            }, // end onSubmit
          ),
        ]),
      ),
    );
  }
}
