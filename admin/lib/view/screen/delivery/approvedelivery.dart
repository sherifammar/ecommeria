import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reporting/deliverycontroller.dart';
import '../../../controller/reporting/users_controller.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customecard.dart';

class UnapproveDelivery extends StatelessWidget {
  const UnapproveDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Deliverycontroller controller = Get.put(Deliverycontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text(" Unapprove Users "),
        centerTitle: true,
      ),
      body: GetBuilder<Deliverycontroller>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Card(
                  child: ListView.builder(
                    itemCount: controller.Data.length,
                    itemBuilder: (context, index) => 
                      
                       
                        InkWell(
                          onTap: () {
                            controller.approveDelivery(controller.Data[index].deliveryId!);
                            
                          },
                          child: CustomCard(
                            countOforders: 'Need to approve',
                            id: '${controller.Data[index].deliveryId}',
                            nameusers: '${controller.Data[index].deliveryName}',
                          ),
                        ),
                      
                      
                    
                    
                  )),
                ),
              
    ));
  }
}