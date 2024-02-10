import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/detailaddress_controller.dart';

import '../../../core/shared/custombutton.dart';
import '../../widget/auth/customtextformauth.dart';

class DetailAddress extends StatelessWidget {
  const DetailAddress({super.key});

  @override
  Widget build(BuildContext context) {
 DetailAddresscontroller controller = Get.put(DetailAddresscontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Add detail of  address"),
      ),
      body: GetBuilder<DetailAddresscontroller>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(children: [
                   const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: 'city',
                      iconData: Icons.location_city_outlined,
                      isNumber: false,
                      labeltext: 'city',
                      mycontroller: controller.city!,
                      valid: (val) {
                        // return validinput(val!, 10, 100, "city");
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: 'street',
                      iconData: Icons.streetview_outlined,
                      isNumber: false,
                      labeltext: 'street',
                      mycontroller: controller.street!,
                      valid: (val) {
                        // return validinput(val!, 10, 100, "street");
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextformauth(
                      hinttext: 'address name',
                      iconData: Icons.home,
                      isNumber: false,
                      labeltext: 'address name',
                      mycontroller: controller.addressname!,
                      valid: (val) {
                        // return validinput(val!, 10, 100, "address name");
                      },
                    ),
                   const SizedBox(
                      height: 15,
                    ),
                    CustomButtom(
                      text: 'Add Detail',
                      onPressed: () {controller.add_AddressData();
                      print("==== detail address=====");},
                    ),
                  ]),
                ),
              )),
    );
  }
}
