
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/ordersdetail_controller.dart';
import '../../../core/class/handingdataview.dart';
import '../../../core/constant/color.dart';

class OrdersDetail extends StatelessWidget {
  const OrdersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailcontroller controller = Get.put(OrdersDetailcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("orders detail"),
        centerTitle: true,
      ),
      body: Container(
          child: GetBuilder<OrdersDetailcontroller>(
        builder: (controller) => HandingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Table(
                            children: [
                              const TableRow(children: [
                                Text(
                                  "Items",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: ColorAPP.primaryColor),
                                ),
                                Text("QTY",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: ColorAPP.primaryColor)),
                                Text("Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: ColorAPP.primaryColor)),
                              ]),
                              ...List.generate(
                                controller.data.length,
                                (index) => TableRow(children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemsPrice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                 Text(
                                  "delivery price :  ${controller.ordersmodels.ordersPricedelivery}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorAPP.primaryColor),
                                ),
                                 Text(
                                  "coupon :  ${controller.ordersmodels.ordersCoupon}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorAPP.primaryColor),
                                ),
                                Text(
                                  "Total price :  ${controller.ordersmodels.ordersTotalprice}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: ColorAPP.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.ordersmodels.ordersType == "0")
                    Card(
                      child: Container(
                        child: ListTile(
                          title: Text("Shipping address"),
                          subtitle: Text(
                              " ${controller.ordersmodels.addressCity} - ${controller.ordersmodels.addressName}  - ${controller.ordersmodels.addressStreet}"),
                        ),
                      ),
                    ),
                  // if (controller.ordersmodels.ordersType == "0") // تم الغاء لعدم ظهور شاشه حمراء
                  //   Container(
                  //     height: 100,
                  //     width: double.infinity,
                  //     child: Expanded(
                  //       child: GoogleMap(
                  //         mapType: MapType.normal,
                  //         markers: controller.makers.toSet(),
                  //         initialCameraPosition: controller.kGooglePlex!,
                  //         onMapCreated: (GoogleMapController controllermap) {
                  //           controller.completecontroller
                  //               .complete(controllermap);
                  //         },
                  //       ),
                  //     ),
                  //   )
                ],
              ),
            )),
      )),
    );
  }
}
