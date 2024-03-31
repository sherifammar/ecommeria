import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/validinput.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';



import '../../../controller/itemscontroller/additems_controller.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/dropdownlist.dart';
import '../../../core/shared/textformglobal.dart';
import '../../controller/setting/settingcontroller.dart';


class Settingadd extends StatelessWidget {
  const Settingadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Settingcontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Setting"),
          centerTitle: true,
        ),
        body: GetBuilder<Settingcontroller>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add title',
                          isNumber: false,
                          labeltext: 'Add title',
                          mycontroller: controller.title,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.title_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add body',
                          isNumber: false,
                          labeltext: 'Add body',
                          mycontroller: controller.body,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.comment,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add delivery time',
                          isNumber: false,
                          labeltext: 'Add delivery time',
                          mycontroller: controller.deliverytime,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.time_to_leave,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  speed',
                          isNumber: false,
                          labeltext: 'Add  speed',
                          mycontroller: controller.speed,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.speed_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  price per kilo',
                          isNumber: false,
                          labeltext: 'Add Add  price per kilo',
                          mycontroller: controller.price,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.money_off,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        
                    
                                            
                                             
                        CustomButtom(
                          text: 'Add',
                          onPressed: () {
                            controller.insertSetting();
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
