import 'package:ecommeria/controller/productdetail_controller.dart';
import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/productdetail/topproductdetail.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailcontrollerImp controller =
        Get.put(ProductDetailcontrollerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          color: ColorAPP.secoandColor,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            child: Text("Go to  cart"),
          ),
        ), // above body
        body: GetBuilder<ProductDetailcontrollerImp>(
          builder: (controller) => HandingDataView(
              statusRequest: controller.statusRequest,
              widget: const TopproductDetail()),
        ));
  }
}
