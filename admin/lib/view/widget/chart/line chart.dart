import 'dart:math';

import 'package:admin/core/class/handingdataview.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/reporting/reportingcontroller.dart';
import '../../../core/constant/color.dart';

class Linechart extends StatelessWidget {
  const Linechart({Key? key}) : super(key: key);

 

 

  @override
  Widget build(BuildContext context) {
     Reportingcontroller controller = Get.put(Reportingcontroller());
   
     return 
      Center(
        
        child: Container(
          margin: EdgeInsets.all(10),
          color: Color.fromARGB(146, 255, 235, 59),
          padding: EdgeInsets.all(10),
          child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      // The red line
                      LineChartBarData(
                        spots: controller.dummyData1,
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.red,
                      ),
                      // The orange line
                      
                    ])),
        ),
      );
              
        
    
    // Scaffold(
    //   body:  Container(
    //        padding: const EdgeInsets.all(10),
    //         width: double.infinity,
    //         child: LineChart(
    //           LineChartData(
    //             borderData: FlBorderData(show: false),
    //             lineBarsData: [
    //               // The red line
    //               LineChartBarData(
    //                 spots: controller.dummyData1,
    //                 isCurved: true,
    //                 barWidth: 3,
    //                 color: Colors.red,
    //               ),
    //               // The orange line
                  
    //             ],
    //           ),
    //         ),
    //       ),
        
      
    // );
  }
   
  }

