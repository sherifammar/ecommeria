import 'package:admin/data/datasourse/remote/items/items_data.dart';
import 'package:admin/data/model/categoriesmodel.dart';
import 'package:admin/linkapi.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/catogeries/catogeries_data.dart';
import '../../data/model/itemsmodel.dart';

class ItemsViewcontroller
 extends GetxController {
  ItemsData testData = ItemsData(
      Get.find()); // binding and get.find => solve problem of constructure crud
  List<ItemsModel> data = []; // to save data from response

  late StatusRequest statusRequest; // for error

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await testData.itemsviewData(); // getData for test_data page == it post data to url test

    print("**************** itemsview controller:   $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update(); // update ui
  }

  goToedite(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemsedite, arguments: {"itemsmodel": itemsModel});
  }

  goToback() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  goToadditems() {
    Get.toNamed(AppRoutes.itemsadd);
  }

  deletItems(String itemsid, String imagename) async {
    await testData.deletItems(
        {"itemsid": itemsid, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == itemsid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
