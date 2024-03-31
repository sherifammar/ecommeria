import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/archiveorderscontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/nameroutes.dart';
import '../../../data/model/ordersmodel.dart';

// class CardlistOrdersarchive extends GetView<OrderPendingController> {
//   final OrdersModel ordersModel;
//   const CardlistOrdersarchive({super.key, required this.ordersModel});

//   @override
//   Widget build(BuildContext context) {
//   //  ArchiveOrderscontroller controller = Get.put(ArchiveOrderscontroller());

//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Order Price : ${ordersModel.ordersTotalprice}",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 // Text(Jiffy('${ordersModel.ordersDatetime}', "yy-MM-dd").fromNow(),
//                 // style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             // Text(
//             //   "Order TYPE :${controller.ordersType('${ordersModel.ordersType}')}",
//             // ),
//             // Text(
//             //   "Order Price :${ordersModel.ordersPrice} \$",
//             // ),
//             // Text(
//             //   "Delivery Price :${ordersModel.ordersPricedelivery}",
//             // ),
//             // Text(
//             //   "payment method :${controller.paymentMethod('${ordersModel.ordersPaymentmethod}')}",
//             // ),
//             // Text(
//             //   "Status order :${controller.ordersStatus('${ordersModel.ordersStatus}')}",
//             // ),
//             const Divider(),
//             Row(
//               children: [
//                 Text(
//                   "Total price : ${ordersModel.ordersTotalprice}",
//                   style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red),
//                 ),
//                 const SizedBox(
//                   width: 3,
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     Get.toNamed("/orderdetail",
//                         arguments: {"ordersmodel": ordersModel});
//                   },
//                   child: Text("Detail"),
//                   color: Colors.red,
//                 ),
//                 const SizedBox(
//                   width: 3,
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     // ArchiveOrderscontroller archivecontroller =
//                     //     Get.put(ArchiveOrderscontroller());
//                     // archivecontroller.showRating(
//                     //     context, ordersModel.ordersId!);
//                   },
//                   child: Text("Rating"),
//                   color: Colors.red,
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//==================== resturant 





class CardOrdersListArchive extends 
 GetView<OrdersArchiveController>
 {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(OrdersArchiveController());
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                 
                
                  Text("${listdata.ordersDate}"),
                    const Spacer(),
                  Text(
                    Jiffy(listdata.ordersDate!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: ColorAPP.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              // Text(
              //     "Order Type : ${controller.printOrderType(listdata!.!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
                  Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                      style: const TextStyle(
                          color: ColorAPP.primaryColor,
                          fontWeight: FontWeight.bold)),
              const Divider(),
              Row(
                children: [
                  

                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersdetail,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: ColorAPP.thirdColor,
                    textColor: ColorAPP.secoandColor,
                    child: const Text("Details"),
                  ),
const Spacer(),
                   MaterialButton(
                    onPressed: () {
                      controller.showRating(context, listdata.ordersId);
                    },
                    color: ColorAPP.thirdColor,
                    textColor: ColorAPP.secoandColor,
                    child: const Text("Rating and comment "),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}