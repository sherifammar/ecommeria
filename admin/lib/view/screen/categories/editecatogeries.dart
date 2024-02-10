import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/catogeriescontroller/editecats_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/textformglobal.dart';

class Editecatogeries extends StatelessWidget {
  const Editecatogeries({super.key});

  @override
  Widget build(BuildContext context) {
    Editecatscontroller controller = Get.put(Editecatscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Edite Catogeries"),
        ),
        body: GetBuilder<Editecatscontroller>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextformglobal(
                          hinttext: '${controller.categories!.categoriesName!}',
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
                          hinttext: '${controller.categories!.categoriesNameAr!}',
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
                        if (controller.file != null) Text("you have image"),
                        // SvgPicture.file(controller.file!),
                        CustomButtom(
                          text: 'save edite',
                          onPressed: () {
                            controller.editeCats();
                          },
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
