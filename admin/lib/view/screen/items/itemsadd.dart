import 'package:admin/core/class/handingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/function/validinput.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/catogeriescontroller/addcats_controller.dart';

import '../../../controller/itemscontroller/additems_controller.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/dropdownlist.dart';
import '../../../core/shared/textformglobal.dart';
import 'package:drop_down_list/drop_down_list.dart';

class Itemsadd extends StatelessWidget {
  const Itemsadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Additemscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Catogeries"),
          centerTitle: true,
        ),
        body: GetBuilder<Additemscontroller>(
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
                     
                        
                        Dropdownsearch(
                          dropdownid: controller.catsid,
                          dropdownname: controller.catsname,
                          listdata: controller.droplist
                          // [
                          //   SelectedListItem(name: "A", value: "1"),
                          //   SelectedListItem(name: "B", value: "2"),
                          // ]// testing
                          ,
                          title: 'Choose',
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
                              child: Image.file(controller.file!),height: 150,width: 100,),

                        CustomButtom(
                          text: 'Add',
                          onPressed: () {
                            controller.additems();
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
