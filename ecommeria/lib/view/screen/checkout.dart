import 'package:ecommeria/core/class/handingdataview.dart';
import 'package:ecommeria/core/constant/color.dart';
import 'package:ecommeria/core/constant/imageasset.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/orders/checkout_controller.dart';
import '../../stripe_payment/payment_manager.dart';
import '../widget/checkout/cardpaymentmethod.dart';
import '../widget/checkout/checkoutaddress.dart';
import '../widget/checkout/deliverytype.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
   ChechoutController controller= Get.put(ChechoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Check out"),
          centerTitle: true,
        ),
        bottomNavigationBar: GetBuilder<ChechoutController>(
          builder: (controller) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
                onPressed: () {
                  controller.getCheckout();
                },
                color: ColorAPP.primaryColor,
                textColor: Colors.white,
                child: Text("Check out")),
          ),
        ),
        body: GetBuilder<ChechoutController>(
            builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    child: ListView(children: [
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Choose payment method",
                        style: TextStyle(
                            color: ColorAPP.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      InkWell(
                          onTap: () {
                            controller.choosePaymentmethod("0");
                          },
                          child: CardPaymentmethodcheckout(
                            isActive:
                                controller.checkPayment == "0" ? true : false,
                            texttitle: 'Cash on delivert',
                          )),
                      InkWell(
                          onTap: () {
                            // controller.choosePaymentmethod("1");
                            controller.payCard();
                           
                          },
                          child: CardPaymentmethodcheckout(
                            isActive:
                                controller.checkPayment == "1" ? true : false,
                            texttitle: 'Payment card',
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: ColorAPP.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: const Text(
                          "Choose  Delivery type",
                          style: TextStyle(
                              color: Colors.white,
                              height: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .chooseDeliverymethod("0"); // delivery =>
                            },
                            child: DeliveryType(
                              isActive: controller.checkDelivery == "0"
                                  ? true
                                  : false,
                              nameImage: ImageAsset.three,
                              texttitle: 'Delivery',
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliverymethod("1"); // 1 = cash
                            },
                            child: DeliveryType(
                              isActive: controller.checkDelivery == "1"
                                  ? true
                                  : false,
                              nameImage: ImageAsset.one,
                              texttitle: 'Recive',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.checkDelivery == "0")
                        Column(
                          children: [
                            const Text(
                              "Shipping Address",
                              style: TextStyle(
                                  color: ColorAPP.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                           
                            ...List.generate(
                                controller.dataaddress.length,
                                (index) => InkWell(
                                      onTap: () {
                                        controller.chooseAddressmethod(
                                            controller
                                                .dataaddress[index].addressId!);
                                      },
                                      child: CheckoutAddress(
                                        isActive: controller.checkAddress ==
                                                controller.dataaddress[index]
                                                    .addressId!
                                            ? true
                                            : false,
                                        texttitle: controller
                                            .dataaddress[index].addressName!,
                                        subtitletext: controller
                                            .dataaddress[index].addressStreet!,
                                      ),
                                    )
                                    )
                          ],
                        )
                    ]),
                  ),
                )));
  }
}
