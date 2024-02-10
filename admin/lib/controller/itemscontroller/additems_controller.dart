import 'dart:io';
import 'dart:math';

import 'package:admin/data/datasourse/remote/items/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';

import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/function/uploadfile.dart';

import '../../data/datasourse/remote/catogeries/catogeries_data.dart';
import '../../data/model/categoriesmodel.dart';
import 'itemsview_controller.dart';
import 'package:drop_down_list/drop_down_list.dart';

class Additemscontroller extends GetxController {
  ItemsData additemsData = ItemsData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none; // for error

  File? file;
  List<SelectedListItem> droplist = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController itemsname;
  late TextEditingController itemsnamear;
  late TextEditingController itemsdesc;
  late TextEditingController itemsdecsar;
  late TextEditingController itemscount;
  // late TextEditingController itemsactive;
  late TextEditingController itemsdiscount;
  // late TextEditingController itemscat;
  late TextEditingController itemsprice;

  late TextEditingController catsname;
  late TextEditingController catsid;
  additems() async {
    if (formState.currentState!.validate()) {
      if (file == null) return Get.snackbar("Warn", "Please chosse Image");
      statusRequest = StatusRequest.loading; // for  loading

      update();
      Map data = {
        "itemsname": itemsname.text,
        "itemsnamear": itemsnamear.text,
        "itemsdesc": itemsdesc.text,
        "itemsdecsar": itemsdecsar.text,
        "itemscount": itemscount.text,
        // "itemsactive": itemsactive.text,
        "itemsprice": itemsprice.text,
        "itemsdiscount": itemsdiscount.text,
        "itemscat": catsid.text
      };
      var response = await additemsData.addItems(data,
          file!); // getData for test_data page == it post data to url test

      print("****************catiview controller:   $response");
      statusRequest = handdlingData(
          response); // it give statusrequest error or statusrequest sucess

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsview);
          ItemsViewcontroller c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update(); // update ui
    }
  }

//==============================
  shownOptionImage() {
    showBottommenu(() => chooseImagecameria(), () => chooseImagegalary());
  }

  chooseImagecameria() async {
    // loading cameria image
    file = await imageUploadcamera();
    update();
  }

  chooseImagegalary() async {
    file = await fileupLoadGallery(false);
    update();
  }

//======================== droplist ui page
  CatogeriesData testData = CatogeriesData(Get.find());

  getcatsData() async {
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await testData
        .catogeriesviewData(); // getData for test_data page == it post data to url test

    print("****************catiview controller:   $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
        for (var i = 0; i < data.length; i++) {
          droplist.add(SelectedListItem(
              name: data[i].categoriesName!, value: data[i].categoriesId));
          print("************************");
          print(data[i].categoriesName!);
          print(data[i].categoriesId!);
          print("************************");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update(); // update ui
  }

  @override
  void onInit() {
    itemsname = TextEditingController();
    itemsnamear = TextEditingController();
    itemsdesc = TextEditingController();
    itemsdecsar = TextEditingController();
    itemscount = TextEditingController();
    // itemsactive = TextEditingController();
    itemsprice = TextEditingController();
    itemsdiscount = TextEditingController();
    // itemscat = TextEditingController();
    //==========================
    catsname = TextEditingController();
    catsid = TextEditingController();
    getcatsData();
    super.onInit();
  }
}
