// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../../../controller/orders/archiveorderscontroller.dart';

// import '../../widget/orders/cardlistorders.dart';
// import '../../widget/orders/cardlistordersarchive.dart';


// class Archive extends StatelessWidget {
//   const Archive({super.key});

//     @override
//   Widget build(BuildContext context) {
//   OrdersArchiveController controller = Get.put(OrdersArchiveController());

//     return Scaffold(
//         appBar: AppBar(
//           title:const Text("Archive Orders"),
//         ),
//         body: Container(
//           child: GetBuilder<OrdersArchiveController>(
//               builder: (controller) => ListView.builder(
//                   itemCount: controller.archivedata.length,
//                   itemBuilder: (context, index) =>CardlistOrdersarchive(ordersModel: controller.archivedata[index]),
//                       ),
//         )
//         ));
//   }
// }
//=======  resturant

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/archiveorderscontroller.dart';
import '../../../core/class/handingdataview.dart';
import '../../widget/orders/cardlistordersarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   OrdersArchiveController controller =  Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Archive Orders' ),
          centerTitle: true,
        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                    itemCount: controller.archiveData .length,
                    itemBuilder: ((context, index) =>
                        CardOrdersListArchive(listdata: controller.archiveData [index])),
                  )))),
        ));
  }
}