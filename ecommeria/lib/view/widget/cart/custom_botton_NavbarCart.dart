import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/nameroutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import 'customButtonCart.dart';
import 'custombuttoncoupon.dart';

class CustomBottomNvbar extends GetView<CartController> {
  final String price;
  // final String discount;
  final String shipping;
  final String discountcoupon;

  final String totalprice;
  final TextEditingController controllercoupon;
  final Function()? onApplycoupon;
  const CustomBottomNvbar(
      {super.key,
      required this.price,
      // required this.discount,
      required this.totalprice,
      required this.controllercoupon,
      required this.onApplycoupon,
      required this.shipping,
      required this.discountcoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(builder: (controller) => 
        controller.couponname == null ?
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: controllercoupon,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          hintText: "Coupon Code",
                          border: OutlineInputBorder()),
                    )),
                SizedBox(width: 5),
                Expanded(
                    flex: 1,
                    child: CustomButtonCoupon(
                      textbutton: "apply",
                      onPressed: onApplycoupon,
                    ))
              ])
              ):Container(child: Text("code coupon : ${controller.couponname}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorAPP.primaryColor),),)
              ),
              SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: ColorAPP.primaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "price",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "$price\$",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Text(
                //       "discount",
                //       style: TextStyle(fontSize: 15),
                //     ),
                //     Text(
                //       "$discount\$",
                //       style: TextStyle(fontSize: 15),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "shipping",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "$shipping\$",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Discount of coupon",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "$discountcoupon\$",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.all(5),
                    child: Divider(
                      color: Colors.black,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "total price",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$totalprice\$",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          CustomButtonCart(
            onPressed: (){controller.goTocheckout();},
            textbutton: ' order',
          )
        ],
      ),
    );
  }
}
