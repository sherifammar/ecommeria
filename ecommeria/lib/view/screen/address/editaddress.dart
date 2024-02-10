
import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/address/EditAddress_controller.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../data/model/addressmodel.dart';
import '../../widget/auth/customtextformauth.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    
    editAddressController controller =Get.put(editAddressController());
    return
 Scaffold(
      appBar: AppBar(
        title: const Text(" Add detail of  address"),
      ),
      body: GetBuilder<editAddressController>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                   const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: '${controller.addressModel.addressCity}',
                      iconData: Icons.location_city_outlined,
                      isNumber: false,
                      labeltext: 'city',
                      mycontroller: controller.city!,
                      valid: (val) {
                        return validinput(val!, 10, 100, "city");
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: '${controller.addressModel.addressStreet}',
                      iconData: Icons.streetview_outlined,
                      isNumber: false,
                      labeltext: 'street',
                      mycontroller: controller.street!,
                      valid: (val) {
                        return validinput(val!, 10, 100, "street");
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: '${controller.addressModel.addressName}',
                      iconData: Icons.home,
                      isNumber: false,
                      labeltext: '${controller.addressModel.addressId}',
                      mycontroller: controller.addressname!,
                      valid: (val) {
                        return validinput(val!, 10, 100, "address name");
                      },
                    ),
                   const SizedBox(
                      height: 15,
                    ),
                    CustomButtom(
                      text: 'Edite',
                      onPressed: () {controller.editeAddressData();
                      print("==== edite  *****address=====");},
                    ),
                  ]),
                ),
              )),
    );
  }
}