import 'package:admin/core/class/handingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reporting/deliverycontroller.dart';
import '../../../controller/reporting/users_controller.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customecard.dart';

class Maxdelivery extends StatelessWidget {
  const Maxdelivery({super.key});

  @override
  Widget build(BuildContext context) {
    Deliverycontroller  controller = Get.put(Deliverycontroller ());
    
    return Scaffold(
      appBar: AppBar(
        title: Text(" Max Delivery "),
        centerTitle: true,
      ),
      body: GetBuilder<Deliverycontroller >(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Card(
                  child: ListView.builder(
                    itemCount: controller.maxDeliverydata.length,
                    itemBuilder: (context, index) => 
                      
                        Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) {
                            String id = controller.maxDeliverydata[index].deliveryId!;
                       controller.removeDelivery(id);
                      },
                          child: CustomCard(
                            countOforders: '${controller.maxDeliverydata[index].count}',
                            id: '${controller.maxDeliverydata[index].deliveryId}',
                            nameusers: '${controller.maxDeliverydata[index].deliveryName}',
                          ),
                        ),
                    //        CustomButtom (onPressed: () {  
                    //   controller.removeDelivery(controller.Data[index].deliveryId!);
                    // }, text: 'Delet',),
                      
                    ),
                  ),
                ),
              ),
    );
  }
}
