import 'package:ecommeria/controller/cart_controller.dart';
import 'package:ecommeria/core/class/handingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/custom_botton_NavbarCart.dart';
import '../widget/cart/customlistitemscart.dart';



class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(" My cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => 
            
            CustomBottomNvbar(
                  price: controller.getTotalConstdeliveryPrice().toString(),
                  // discount: '${controller.discountcoupon}',
                  // totalprice: '${controller.getTotalWithdeliveryPrice()}!', //السعر الكلى مضاف اليه التوصيل
                  totalprice: controller.getTotalConstdeliveryPrice().toString(),
                  controllercoupon: controller.controllercoupon!,
                  shipping: controller.deliveryPrice!,
                  // shipping: controller.deliveryPrice!,// اضافه السعر من الخريطه
                  onApplycoupon: () {
                    controller.couponView();
                    
                  },
                  discountcoupon: '${controller.discountcoupon}',
                )
                ),
        body:
         GetBuilder<CartController>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    // Topcart(
                    //   message: 'count :${cartcontroller.totaldifferentitems}',
                    // ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        
                        children: [
                          
                          ...List.generate(
                            cartcontroller.data.length,
                            (index) => CustomListitemsCart(
                              count:
                                  ' ${cartcontroller.data[index].countitems}',
                              name: '${cartcontroller.data[index].itemsName} ',
                              price:
                                  '${cartcontroller.data[index].itemsprice}\$',
                              imagename:
                                  '${cartcontroller.data[index].itemsImage}',
                              onAdd: () async {
                                await cartcontroller.addcart(
                                    ' ${cartcontroller.data[index].itemsId!}');
                                cartcontroller.refreshPage();
                              },
                              onRemove: () async {
                                await cartcontroller.removecart(
                                    ' ${cartcontroller.data[index].itemsId!}');
                                cartcontroller.refreshPage();
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ))
                
               
                );
  }
}
