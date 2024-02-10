import 'package:get/get.dart';

import '../core/class/StatusRequest.dart';
import '../core/function/handlingdatacontroller.dart';
import '../core/services/servives.dart';
import '../data/datasourse/remote/ratingitems_data.dart';
import '../data/model/ratingitems/allratingitemsviewmodel.dart';

class AllratingDetailController extends GetxController {
  Myservices myservices = Get.find();
  late StatusRequest statusRequest;
  List<AllratingitemsviewModel> allrating = [];

  String? itemsid;
  ratingItemsData ratingitemsdata = ratingItemsData(Get.find());
  String? starsitem;

  getAllratingitems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ratingitemsdata.getRatingitems(itemsid);

    print("**************** $response");
    statusRequest = handdlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        allrating.addAll(
            responsedata.map((e) => AllratingitemsviewModel.fromJson(e)));
        print("===========  controller ===============");
        print(allrating);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update(); // update ui
  }

  @override
  void onInit() {
    itemsid = Get.arguments["itemsid"];
    getAllratingitems(itemsid!);
  }
}
