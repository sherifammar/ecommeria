import 'package:admin/data/model/categoriesmodel.dart';
import 'package:admin/linkapi.dart';
import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/nameroutes.dart';
import '../../core/function/handlingdatacontroller.dart';
import '../../data/datasourse/remote/catogeries/catogeries_data.dart';

class CatogeriesViewcontroller extends GetxController {
  CatogeriesData testData = CatogeriesData(
      Get.find()); // binding and get.find => solve problem of constructure crud
  List<CategoriesModel> data = []; // to save data from response

  late StatusRequest statusRequest; // for error

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading; // for  loading
    update();
    var response = await testData
        .catogeriesviewData(); // getData for test_data page == it post data to url test

    print("****************catiview controller:   $response");
    statusRequest = handdlingData(
        response); // it give statusrequest error or statusrequest sucess

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update(); // update ui
  }

  goToedite(CategoriesModel catsModel) {
    Get.toNamed(AppRoutes.catogeriesedite, arguments: {"catsmodel": catsModel});
  }

  goToback() {
    Get.offAllNamed(AppRoutes.home);
    return Future.value(false);
  }

  goToaddcats() {
    Get.toNamed(AppRoutes.catogeriesadd);
  }

  deletCatogeries(String categoriesid, String imagename) async {
    await testData.deletCatogeries(
        {"categoriesid": categoriesid, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == categoriesid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
