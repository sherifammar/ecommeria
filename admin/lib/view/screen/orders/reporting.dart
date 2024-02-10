import 'dart:io';

import 'package:admin/view/widget/orders/cardetailreport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../controller/reporting/reportingcontroller.dart';
import '../../widget/chart/line chart.dart';

import '../../widget/orders/searchappbar.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Reportingcontroller());

    return GetBuilder<Reportingcontroller>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Rporting"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Searchappbar(
            //     mycontroller1: controller.searchmounth1!,
            //     mycontroller2: controller.searchmounth2!,
            //     titleappbar: 'Mouth',
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Searchappbar(
            //     mycontroller1: controller.searchyear1!,
            //     mycontroller2: controller.searchyear2!,
            //     titleappbar: 'Year',
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            //  ...List.generate(
              
            //       controller.reportingdata.length,
            //       (index) => 
                   
            //          Expanded(
                     
            //            child: Container(
            //             height: 100,
            //             width: 150,
            //              child: Column(children: [
            //               Text(
            //                 " Total price : ${controller.reportingdata[index].totalitemsprice}",
            //                 textAlign: TextAlign.center,
            //               ),
            //               Text(
            //                 " Total delivery price :${controller.reportingdata[index].totalpricedelivery}",
            //                 textAlign: TextAlign.center,
            //               ),
            //               Text(
            //                 " Total number order : ${controller.reportingdata[index].totalnumberorders}",
            //                 textAlign: TextAlign.center,
            //               ),
            //                Expanded(child: Linechart())
            //                                ]),
            //            ),
            //          ),
            //       ),
            //     Expanded(
                  
            //       child: Linechart()),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height:100,
              child: Column(
                children: [
                 
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.detailData.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                       CardDetailReport(
                            adminmodel: controller.detailData[index]),
                            
                      ],
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controller.getChart();
        //   },
        //   child: const Text("put"),
        // ),
      ),
    );
  }
}
