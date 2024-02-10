import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/productdetail_controller.dart';
import '../../../core/constant/color.dart';


class SubitemsList extends GetView<ProductDetailcontrollerImp> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItem.length,
          (index) => Container(
            margin:const EdgeInsets.only(right: 10),

            alignment: Alignment.center, // add text in center on container
            height: 50,
            width: 60,
            decoration: BoxDecoration(
                color: controller.subItem[index]["active"] == "1"// 1 is stringe
                    ? Colors.white
                    : ColorAPP.grey2,
                border: Border.all(
                  color: ColorAPP.black,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              "${controller.subItem[index]["name"]}",// main =>red , yellow
              style: TextStyle(
                  color: controller.subItem[index]["active"] == "1"
                      ? Colors.white
                      : ColorAPP.grey2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        
        
      ],
    );
  }
}
