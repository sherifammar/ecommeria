import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/catogeriescontroller/addcats_controller.dart';

import '../../../core/shared/custombutton.dart';
import '../../../core/shared/textformglobal.dart';


class Addcatogeries extends StatelessWidget {
  const Addcatogeries({super.key});

  @override
  Widget build(BuildContext context) {
Get.put(Addcatscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Catogeries"),
        ),
        body: GetBuilder<Addcatscontroller>(
          builder: (controller)=>HandingDataView(statusRequest: controller.statusRequest!, widget:  Container(
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextformglobal(
                        hinttext: 'Add catoger name',
                        isNumber: false,
                        labeltext: 'Add catoger name',
                        mycontroller: controller.catsname,
                        valid: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        iconData: Icons.category,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextformglobal(
                        hinttext: 'Add catoger arabic name',
                        isNumber: false,
                        labeltext: 'Add catoger arabic name',
                        mycontroller: controller.catsnamear,
                        valid: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        iconData: Icons.category,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          color: ColorAPP.primaryColor,
                        textColor: ColorAPP.grey2,
                          onPressed: () {
                            controller.chooseImage();
                          },
                          child: Text("Add Image "),
                        ),
                      ),
                      if(controller.file !=null)
                      Text("you have image"),
                      // SvgPicture.file(controller.file!),
                      CustomButtom(
                        text: 'Add',
                        onPressed: () {
                          controller.addCats();
                        },
                      )
                    ],
                  ),
                ),
              )
              )
              
        ));
  }
}
