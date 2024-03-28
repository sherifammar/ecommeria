import 'dart:io';
import 'dart:typed_data';

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Searchappbar(
                mycontroller1: controller.searchmounth1!,
                mycontroller2: controller.searchmounth2!,
                titleappbar: 'Mouth',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Searchappbar(
                mycontroller1: controller.searchyear1!,
                mycontroller2: controller.searchyear2!,
                titleappbar: 'Year',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Text("Result of Search ", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
            ...List.generate(
              controller.reportingdata.length,
              (index) => Container(
                child: Column(children: [
                  const Divider(
                    thickness: 3,
                  ),
                  Text(
                    " Total price : ${controller.reportingdata[index].totalitemsprice}",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Total delivery price :${controller.reportingdata[index].totalpricedelivery}",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Total number order : ${controller.reportingdata[index].totalnumberorders}",
                    textAlign: TextAlign.center,
                  ),
                  //  Expanded(child: Linechart()),
                ]),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Expanded(child: Linechart()),
            const Divider(
              thickness: 5,
            ),
            const SizedBox(
              height: 5,
            ),
                        const Text("Orders ", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
           const Divider(
              thickness: 5,
            ),
            Container(
              width: double.infinity,
              height: 170,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.detailData.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    CardDetailReport(adminmodel: controller.detailData[index]),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getChart();
          },
          child: const Text("Chart" ),
        ),
      ),
    );
  }
}
