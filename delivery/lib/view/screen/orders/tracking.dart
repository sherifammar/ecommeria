import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/orders/ordersdetail_controller.dart';
import '../../../controller/orders/trackingcontroller.dart';
import '../../../core/class/handingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/getpolyline.dart';
import '../../../core/shared/custombutton.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Trackingcontroller controller = Get.put(Trackingcontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("orders Tracking"),
          centerTitle: true,
        ),
        body: Container(
          child: GetBuilder<Trackingcontroller>(
              builder: (controller) => HandingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Center(
                        child: Text("${controller.ordersModel.addressUsersid}"),
                      ), // for test
                      // Expanded(
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(vertical: 10),
                      //     width: double.infinity,
                      //     child: Expanded(
                      //       child: GoogleMap(
                      //         mapType: MapType.normal,
                      //         markers: controller.makers.toSet(),
                      //         initialCameraPosition: controller.kGooglePlex!,
                      //         polylines: controller.polylineset,
                      //         onMapCreated:
                      //             (GoogleMapController controllermap) {
                      //           controller.gMc =controllermap;// controller to cameria
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      CustomButtom(
                        text: 'Delivery has receive',
                        onPressed: () {
                          controller.doneDelivery();
                        },
                      )
                    ],
                  ))),
        ));
  }
}
