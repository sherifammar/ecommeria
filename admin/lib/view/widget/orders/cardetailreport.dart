import 'package:admin/data/model/winadminmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/orders/orderspendingcontroller.dart';

import '../../../controller/reporting/reportingcontroller.dart';
import '../../../data/model/adminreportmodels.dart';


class CardDetailReport extends GetView<OrderPendingController> {
  final AdminReportModels adminmodel;
  const CardDetailReport({super.key, required this.adminmodel});

  @override
  Widget build(BuildContext context) {
   Reportingcontroller controller = Get.put(Reportingcontroller ());

    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                    Row(
                      children: [
                       
                        Text(
                          "Order Price : $adminmodel.itemsprice}",
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
                    "total price delivery :$adminmodel.totalpricedelivery}",
                  ),
                  Text(
                    "Total items price :$adminmodel.totalitemsprice}",
                  ),
                  Text(
                    "total number orders:$adminmodel.totalnumberorders}",
                  ),
                  Text(
                    "total count items :$adminmodel.totalcountitems}",
                  ),
                
                 
                      
                   
                      
                  
                  
                ],
              ),
            ),
          ),
      
      
    );
  }
  
}