import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/function/handlingdatacontroller.dart';
import '../../core/services/servives.dart';

import '../../data/datasourse/remote/report/report_data.dart';

import '../../data/model/adminreportmodels.dart';
import '../../data/model/winadminmodel.dart';

class Reportingcontroller extends GetxController {
  List<WinadminModels> reportingdata = []; // to save data from response
  List<AdminReportModels> detailData = [];
  TextEditingController? searchmounth1;
  TextEditingController? searchmounth2;
  TextEditingController? searchyear1;
  TextEditingController? searchyear2;
  StatusRequest? statusRequest = StatusRequest.none;
  ReportData report = ReportData(Get.find());
  Myservices myservices = Get.find();
  List<FlSpot>? dummyData1;

  getChart() async {
    reportingdata.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await report.getChartData(
        searchmounth1!.text,
        searchmounth2!.text,
        searchyear1!.text,
        searchyear2!
            .text); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        reportingdata
            .addAll(responsedata.map((e) => WinadminModels.fromJson(e)));
        dummyData1 = List.generate(reportingdata.length, (index) {
          return FlSpot(double.parse(reportingdata[index].totalitemsprice!),
              double.parse(reportingdata[index].mounth!));
        });

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  // ================================================
  toDay() async {
    reportingdata.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await report
        .getTodayData(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        reportingdata
            .addAll(responsedata.map((e) => WinadminModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

// =============================

  detailBuy() async {
    detailData.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await report.getDetailsadmin(); // getData for test_data page == it post data to url test

    print("**************** $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        // to save data from response
        detailData
            .addAll(responsedata.map((e) => AdminReportModels.fromJson(e)));

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  @override
  void onInit() {
    searchmounth1 = TextEditingController();
    searchmounth2 = TextEditingController();
    searchyear1 = TextEditingController();
    searchyear2 = TextEditingController();

 detailBuy();
  toDay();
    super.onInit();
  }

  @override
  void dispose() {
    searchmounth1!.dispose();
    searchmounth2!.dispose();
    searchyear1!.dispose();
    searchyear2!.dispose();
    super.dispose();
  }
}
