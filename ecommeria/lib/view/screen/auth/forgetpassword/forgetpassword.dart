import 'package:ecommeria/core/class/StatusRequest.dart';
import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/view/widget/auth/customTextauth.dart';
import 'package:ecommeria/view/widget/auth/customTextbodyauth.dart';
import 'package:ecommeria/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/function/validinput.dart';
import '../../../../core/location/changelocalcontroller.dart';
import '../../../widget/auth/Custombuttomauth.dart';
import '../../../widget/auth/customtextsignuporsginin.dart';
import '../../../widget/auth/logoimage.dart';

class ForgetPasswprd extends StatelessWidget {
  const ForgetPasswprd({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswprdcontrollerImp forgetPassword_controller =
        Get.put(ForgetPasswprdcontrollerImp());
    Localcontroller controller = Get.put(
        Localcontroller()); // do not forget to add controller to change language
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorAPP.background,
          elevation: 0.0,
          title: Text("forget paswword",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: ColorAPP.grey)),
        ),
        body: GetBuilder<ForgetPasswprdcontrollerImp>(
          builder: (controller) =>  HandingDataRequest(statusRequest: controller.statusRequest, widget:Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: forgetPassword_controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      const CustomTextauth(text: "check email"),
                      const SizedBox(height: 20),
                      CustomTextformauth(
                        valid: (val) {
                          return validinput(val!, 5, 100, "email");
                        },
                        hinttext: "Enter Your email",
                        iconData: Icons.email_outlined,
                        labeltext: "email",
                        mycontroller: forgetPassword_controller.email,
                        isNumber: false,
                      ),
                      const SizedBox(height: 20),
                      CustomButtomauth(
                          text: "check",
                          onPressed: () {
                            forgetPassword_controller.checkemail();
                          }),
                      SizedBox(height: 30),
                    ]),
                  ),
                ),) 
        ));
  }
}
