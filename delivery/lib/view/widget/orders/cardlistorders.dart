import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';


import '../../../controller/orders/acceptecontroller.dart';
import '../../../controller/orders/orderspendingcontroller.dart';

import '../../../data/model/ordersmodel.dart';

class CardlistOrders extends GetView<OrderPendingController> {
  final OrdersModel ordersModel;
  const CardlistOrders({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    OrderPendingController controller = Get.put(OrderPendingController());

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Price : ${ordersModel.ordersTotalprice}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Text(Jiffy('${ordersModel.ordersDatetime}', "yy-MM-dd").fromNow(),
                // style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Order TYPE :${controller.ordersType('${ordersModel.ordersType}')}",
            ),
            Text(
              "Order Price :${ordersModel.ordersPrice} \$",
            ),
            Text(
              "Delivery Price :${ordersModel.ordersPricedelivery}",
            ),
            Text(
              "payment method :${controller.paymentMethod('${ordersModel.ordersPaymentmethod}')}",
            ),
            Text(
              "Status order :${controller.ordersStatus('${ordersModel.ordersStatus}')}",
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total price : ${ordersModel.ordersTotalprice}",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                // SizedBox(width: 5,),
                //  if(ordersModel.ordersRating == "0")
               
                const SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed("/orderdetail",
                        arguments: {"ordersmodel": ordersModel});
                  },
                  child: Text("Detail"),
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                if(ordersModel.ordersStatus=="2")
               MaterialButton(
                  onPressed: () {
                 controller.approveOrder(ordersModel.ordersId!, ordersModel.ordersUsersid!);
                                  },
                  child: Text("Accept"),
                  color: Colors.red,
                ),
                if(ordersModel.ordersStatus=="3")
               MaterialButton(
                  onPressed: () {
                    AcceptController controller = Get.put(AcceptController());
                 controller.doneOrders(ordersModel.ordersId!, ordersModel.ordersUsersid!);
                                  },
                  child: Text("received"),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
