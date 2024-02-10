import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/itemscontroller/editeitems_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/dropdownlist.dart';
import '../../../core/shared/textformglobal.dart';

class Itemsedite extends StatelessWidget {
  const Itemsedite({super.key});

  @override
  Widget build(BuildContext context) {
    Editeitemscontroller controller = Get.put(Editeitemscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Edite Catogeries"),
          centerTitle: true,
        ),
        body: GetBuilder<Editeitemscontroller>(
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
                          hinttext: 'Add catoger name',
                          isNumber: false,
                          labeltext: 'Add catoger name',
                          mycontroller: controller.itemsname,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add catoger arabic name',
                          isNumber: false,
                          labeltext: 'Add catoger arabic name',
                          mycontroller: controller.itemsnamear,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add Descrpition of items',
                          isNumber: false,
                          labeltext: 'Add Descrpition of items',
                          mycontroller: controller.itemsdesc,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  arabic Descrpition of items',
                          isNumber: false,
                          labeltext: 'Add arabic Descrpition of items',
                          mycontroller: controller.itemsdecsar,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  count of items',
                          isNumber: false,
                          labeltext: 'Add count of items',
                          mycontroller: controller.itemscount,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  price of items',
                          isNumber: false,
                          labeltext: 'Add  price of items',
                          mycontroller: controller.itemsprice,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextformglobal(
                          hinttext: 'Add  discount price of items',
                          isNumber: false,
                          labeltext: 'Add  discount price of items',
                          mycontroller: controller.itemsdiscount,
                          valid: (val) {
                            return validinput(val!, 1, 30, "");
                          },
                          iconData: Icons.category_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RadioListTile(
                          title: Text("Disappear and Inactive"),
                            value: "0",
                            groupValue: controller.active,
                            onChanged: (val) {controller.changeActive(val);
                            print(val);}),
                        RadioListTile(
                            title: Text("Appear and Active"),
                            value: "1",
                            groupValue: controller.active,
                            onChanged: (val) {controller.changeActive(val);
                            print(val);}),
                        const SizedBox(
                          height: 15,
                        ),
                        Dropdownsearch(
                          dropdownid: controller.catsid,
                          dropdownname: controller.catsname,
                          listdata: controller.droplist
                          // [
                          //   SelectedListItem(name: "A", value: "1"),
                          //   SelectedListItem(name: "B", value: "2"),
                          // ]// testing
                          ,
                          title: 'Choose catogeries',
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            color: ColorAPP.primaryColor,
                            textColor: ColorAPP.grey2,
                            onPressed: () {
                              controller.shownOptionImage();
                            },
                            child: Text("Add Image "),
                          ),
                        ),
                        if (controller.file != null)
                          // Center(child: Text("you have image")),
                          // SvgPicture.file(controller.file!),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Image.file(controller.file!),
                            height: 150,
                            width: 100,
                          ),
                        CustomButtom(
                          text: 'edite',
                          onPressed: () {
                            controller.editeItems();
                          },
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
