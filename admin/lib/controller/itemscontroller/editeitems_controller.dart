import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasourse/remote/catogeries/catogeries_data.dart';
import '../../data/datasourse/remote/items/items_data.dart';
import '../../data/model/categoriesmodel.dart';
import '../../data/model/itemsmodel.dart';
import 'itemsview_controller.dart';

class Editeitemscontroller extends GetxController {
  late ItemsModel? items; // error
  ItemsData editeData = ItemsData(Get.find());

  StatusRequest? statusRequest = StatusRequest.none; // for error
  String? active;
  File? file;
  List<SelectedListItem> droplist = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController itemsname;
  late TextEditingController itemsnamear;
  late TextEditingController itemsdesc;
  late TextEditingController itemsdecsar;
  late TextEditingController itemscount;
  late TextEditingController itemsactive;
  late TextEditingController itemsdiscount;
  // late TextEditingController itemscat;
  late TextEditingController itemsprice;
  late TextEditingController catsname;
  late TextEditingController catsid;

  changeActive(val) {
    active = val;
    update();
  }

  editeItems() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading; // for  loading

      update();
      Map data = {
        "itemsname": itemsname.text,
        "itemsnamear": itemsnamear.text,
        "itemsdesc": itemsdesc.text,
        "itemsdecsar": itemsdecsar.text,
        "itemscount": itemscount.text,
        "itemsactive": active, // change by function
        "itemsprice": itemsprice.text,
        "itemsdiscount": itemsdiscount.text,
        "itemscat": catsid.text,
        "itemsid": items!.itemsId!.toString(),
        "imageold": items!.itemsImage!
      };
      var response = await editeData.editeItems(
          data, file); // getData for test_data page == it post data to url test

      print("**************** editeview controller:   $response");
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
    file = await imageUploadcamera(); // add in file
    update();
  }

  chooseImagegalary() async {
    file = await fileupLoadGallery(false);
    update();
  }

//======================== droplist in ui
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
    itemsactive = TextEditingController();
    itemsprice = TextEditingController();
    itemsdiscount = TextEditingController();
    // itemscat = TextEditingController();

    items = Get.arguments["itemsmodel"];

    itemsname.text = items!.itemsName!;
    itemsnamear.text = items!.itemsNameAr!;
    itemsdesc.text = items!.itemsDesc!;
    itemsdecsar.text = items!.itemsDecsAr!;
    itemscount.text = items!.itemsCount!;
    // itemsactive.text = items!.itemsActive!;
    itemsprice.text = items!.itemsPrice!;
    itemsdiscount.text = items!.itemsDiscount!;
    // itemscat.text = items!.itemsCat!;

    catsname = TextEditingController();
    catsid = TextEditingController();
    getcatsData();
    active = items?.itemsActive;
    super.onInit();
  }
}
