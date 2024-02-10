
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
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

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp logincontroller = Get.put(LogincontrollerImp());
    Localcontroller controller = Get.put(Localcontroller()); 
    
    // do not forget to add controller to change language
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorAPP.background,
          elevation: 0.0,
          title: Text('2'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: ColorAPP.grey)),
        ),
        body: WillPopScope(
            onWillPop: alertExitAPP,
            child: GetBuilder<LogincontrollerImp>(
                builder: (controller) => HandingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Form(
                          key: logincontroller.formstate,// globel key for validate
                          child: ListView(children: [
                            const Imageauth(),
                            const SizedBox(height: 20),
                            const CustomTextauth(text: "wellcome"),
                            const SizedBox(height: 10),
                            const CustomTextbodyauth(
                              textbody:
                                  "Sign In With Your Email And Password OR Continue With Social Media",
                            ),
                            const SizedBox(height: 15),
                            CustomTextformauth(
                              // error in mycontroller => remove const

                              valid: (val) {
                                return validinput(val!, 5, 100, "email");
                              },
                              hinttext: "Enter Your Email",
                              iconData: Icons.email_outlined,
                              labeltext: "Email",
                              mycontroller: logincontroller.email,
                              isNumber: false,
                            ),
                            const SizedBox(height: 15),
                            GetBuilder<LogincontrollerImp>(
                              builder: (logincontroller) => CustomTextformauth(
                                obscureText: logincontroller.isShowpassword,// show password
                                onTapicon: () {
                                  logincontroller.showPassword();
                                },
                                valid: (val) {
                                  return validinput(val!, 3, 100, "password");
                                },
                                hinttext: "Enter Your Password",
                                iconData: Icons.lock_outline,
                                labeltext: "Password",
                                mycontroller: logincontroller.password,
                                isNumber: true,
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                logincontroller.gotoforgetpassword();
                              },
                              child: const Text(
                                "Forget Password",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            CustomButtomauth(
                                text: "Sign In",
                                onPressed: () {
                                  logincontroller.login();
                                }),
                            SizedBox(height: 30),
                            CustomTextSginuporsignin(
                              textone: 'Do not have an account',
                              texttwo: 'Sgin up',
                              onTap: () {
                                logincontroller.gotosginup();
                              },
                            )
                          ]),
                        ),
                      ),
                    ))));
  }
}
