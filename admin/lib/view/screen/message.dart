import 'package:admin/core/class/handingdataview.dart';

import 'package:admin/core/function/validinput.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';




import '../../../core/shared/textformglobal.dart';


import '../../controller/messagecontroller.dart';
import '../../core/shared/custombutton.dart';

class Messagesending extends StatelessWidget {
  const Messagesending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Messagecontroller());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Sending Message"),
          centerTitle: true,
        ),
        body: GetBuilder<Messagecontroller>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget:  Container(
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add Title',
                          isNumber: false,
                          labeltext: 'Add Title',
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
                          hinttext: 'Add Body',
                          isNumber: false,
                          labeltext: 'Add Body',
                          mycontroller: controller.body,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.message_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add Topic',
                          isNumber: false,
                          labeltext: 'Add Topic',
                          mycontroller: controller.top,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.type_specimen,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  Usersid',
                          isNumber: true,
                          labeltext: 'Add Usersid',
                          mycontroller: controller.usersid,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.numbers_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        CustomButtom(
                          text: 'Send',
                          onPressed: () {
                            controller.insertMessage();
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
