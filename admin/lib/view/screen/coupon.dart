import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/catogeriescontroller/addcats_controller.dart';

import '../../../core/class/handingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/validinput.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/dropdownlist.dart';
import '../../../core/shared/textformglobal.dart';
import '../../controller/coupon&points_controller.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponAndPointsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edite Coupon"),
        ),
        body: GetBuilder<CouponAndPointsController>(
            builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest!,
                widget: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.coupondata.length,
                          itemBuilder: (context, index) => Center(
                                child: Column(
                                  children: [
                                   const  SizedBox(height: 25,),
                                    Text(
                                        " coupon name:  ${controller.coupondata[index].couponName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(
                                        " coupon count: ${controller.coupondata[index].couponCount}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(
                                        " coupon discount: ${controller.coupondata[index].couponDiscount}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text(
                                        "coupon expire:  ${controller.coupondata[index].couponExpiredate}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              )),
                      Container(
                        padding: EdgeInsets.all(30),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextformglobal(
                                hinttext: 'Add coupon name',
                                isNumber: false,
                                labeltext: 'Add coupon name',
                                mycontroller: controller.couponname,
                                valid: (val) {
                                  return validinput(val!, 1, 30, "");
                                },
                                iconData: Icons.category,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextformglobal(
                                hinttext: 'Add count',
                                isNumber: true,
                                labeltext: 'Add count',
                                mycontroller: controller.couponcount,
                                valid: (val) {
                                  return validinput(val!, 1, 30, "");
                                },
                                iconData: Icons.home_max_outlined,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextformglobal(
                                hinttext: 'Add discount',
                                isNumber: true,
                                labeltext: 'Add discount',
                                mycontroller: controller.coupondiscount,
                                valid: (val) {
                                  return validinput(val!, 1, 30, "");
                                },
                                iconData: Icons.comment_bank_outlined,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: controller.dateTime,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                    if (newDate == null) return;
                                    TimeOfDay? newTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour: controller.dateTime.hour,
                                            minute: controller.dateTime.minute));
                                    if (newTime == null) return;
                                    final newDateTime = DateTime(
                                      newDate.year,
                                      newDate.month,
                                      newDate.day,
                                      newTime.hour,
                                      newTime.minute,
                                    );
                
                                    controller.chooseCouponexpiredate(
                                        newDateTime.toString());
                                    print(newDateTime.toString());
                                  },
                                  child: const Text("Expire date")),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.editeCoupon();
                                  },
                                  child: const Text("Edite Coupon")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
