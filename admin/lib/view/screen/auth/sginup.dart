
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/sginup_controller.dart';
import '../../../core/class/handingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/alertexitapp.dart';
import '../../../core/function/validinput.dart';
import '../../../core/location/changelocalcontroller.dart';
import '../../widget/auth/Custombuttomauth.dart';
import '../../widget/auth/customTextauth.dart';
import '../../widget/auth/customTextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtextsignuporsginin.dart';
import '../../widget/auth/logoimage.dart';

class Sginup extends StatelessWidget {
  const Sginup({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SginupcontrollerImp());
    SginupcontrollerImp sginupcontroller = Get.put(SginupcontrollerImp());
    Localcontroller controller = Get.put(Localcontroller()); // do not forget to add controller to change language
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorAPP.background,
          elevation: 0.0,
          title: Text("sign out",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: ColorAPP.grey)),
        ),
        // body: GetBuilder<SginupcontrollerImp>(
        //   builder: (controller) => WillPopScope(
        //     onWillPop: alertExitAPP,
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        //       child: Form(
        //         key: controller.formstate,
        //         child: ListView(children: [
        //           const SizedBox(height: 20),
        //           const CustomTextauth(text: "wellcome"),
        //           const SizedBox(height: 10),
        //           const CustomTextbodyauth(
        //             textbody:
        //                 "Sign In With Your Email And Password OR Continue With Social Media",
        //           ),
        //           const SizedBox(height: 15),
        //           CustomTextformauth(
        //             valid: (val) {
        //               return validinput(val!, 5, 100, "username");
        //             },
        //             hinttext: "Enter Your username",
        //             iconData: Icons.person_4_outlined,
        //             labeltext: "username",
        //             mycontroller: controller.username,
        //             isNumber: false,
        //           ),
        //           const SizedBox(height: 15),
        //           CustomTextformauth(
        //             valid: (val) {
        //               return validinput(val!, 3, 100, "phone");
        //             },
        //             hinttext: "Enter Your phone",
        //             iconData: Icons.phone_android_outlined,
        //             labeltext: "Phone",
        //             mycontroller: controller.phone,
        //             isNumber: true,
        //           ),
        //           const SizedBox(height: 10),
        //           CustomTextformauth(
        //             valid: (val) {
        //               return validinput(val!, 5, 100, "email");
        //             },
        //             hinttext: "Enter Your email",
        //             iconData: Icons.email_outlined,
        //             labeltext: "email",
        //             mycontroller: controller.email,
        //             isNumber: false,
        //           ),
        //           const SizedBox(height: 10),
        //           CustomTextformauth(
        //             valid: (val) {
        //               return validinput(val!, 3, 100, "password");
        //             },
        //             hinttext: "Enter Your password",
        //             iconData: Icons.lock_outline,
        //             labeltext: "Password",
        //             mycontroller: controller.password,
        //             isNumber: true,
        //           ),
        //           const SizedBox(height: 10),
        //           CustomButtomauth(
        //               text: "Sign up",
        //               onPressed: () {
        //                 controller.Sginup();
        //               }),
        //           SizedBox(height: 30),
        //           CustomTextSginuporsignin(
        //             onTap: () {
        //               controller.gotosignin();
        //             },
        //             textone: 'have an account ? ',
        //             texttwo: 'Sign Up',
        //           )
        //         ]),
        //       ),
        //     ),
        //   ),
        // )
        body: WillPopScope(
            onWillPop: alertExitAPP,
            child: GetBuilder<SginupcontrollerImp>(
                builder: (controller) => HandingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: sginupcontroller.formstate,
                          child: ListView(children: [
                            const SizedBox(height: 20),
                            const CustomTextauth(text: "wellcome"),
                            const SizedBox(height: 10),
                            const CustomTextbodyauth(
                              textbody:
                                  "Sign In With Your Email And Password OR Continue With Social Media",
                            ),
                            const SizedBox(height: 15),
                            CustomTextformauth(
                              valid: (val) {
                                return validinput(val!, 5, 100, "username");
                              },
                              hinttext: "Enter Your username",//parameter
                              iconData: Icons.person_4_outlined,//parameter
                              labeltext: "username",//parameter
                              mycontroller: sginupcontroller.username,//parameter
                              isNumber: false,// change type text to number
                            ),
                            const SizedBox(height: 15),
                            CustomTextformauth(
                              valid: (val) {
                                return validinput(val!, 3, 100, "password");
                              },
                              hinttext: "Enter Your password",
                              iconData: Icons.lock_outline,
                              labeltext: "Password",
                              mycontroller: sginupcontroller.password,
                              isNumber: true,
                            ),
                            const SizedBox(height: 10),
                            CustomTextformauth(
                              valid: (val) {
                                return validinput(val!, 5, 100, "email");
                              },
                              hinttext: "Enter Your email",
                              iconData: Icons.email_outlined,
                              labeltext: "email",
                              mycontroller: sginupcontroller.email,
                              isNumber: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextformauth(
                              valid: (val) {
                                return validinput(val!, 3, 100, "phone");
                              },
                              hinttext: "Enter Your phone",
                              iconData: Icons.phone_android_outlined,
                              labeltext: "Phone",
                              mycontroller: sginupcontroller.phone,
                              isNumber: true,
                            ),
                            const SizedBox(height: 10),
                            CustomButtomauth(
                                text: "Sign up",
                                onPressed: () {
                                  sginupcontroller.Sginup();
                                }),
                            SizedBox(height: 30),
                            CustomTextSginuporsignin(
                              onTap: () {
                                sginupcontroller.gotosignin();
                              },
                              textone: 'have an account ? ',
                              texttwo: 'Sign Up',
                            )
                          ]),
                        ),
                      ),
                    ))));
  }
}
