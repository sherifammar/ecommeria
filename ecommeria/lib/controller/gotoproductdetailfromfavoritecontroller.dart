// import 'package:get/get.dart';

// import '../core/class/StatusRequest.dart';
// import '../core/function/handlingdatacontroller.dart';
// import '../core/services/servives.dart';
// import '../data/datasourse/remote/myfavoriteview.dart';

// class GoToproductdetail extends GetxController {
//   MyfavoriteviewData myfavoriteviewdata =
//       MyfavoriteviewData(Get.find()); // connect to data
//   late StatusRequest statusRequest;
//   Myservices myservices = Get.find();
//   List itemsdata = [];

//   favoritetoProductdetail(String itemsid) async {
   
//     statusRequest = StatusRequest.loading;
//     update();
//     var response =
//         await myfavoriteviewdata.myfavoriteToproductdetailData(itemsid);

//     print("**************** $response");
//     statusRequest = handdlingData(response);

//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         List responsedata = response['data'];
//         itemsdata.addAll(response['data']);
//         print("===========  controller ===============");
//         print(itemsdata);
//         update();
       
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }

//     update(); // update ui
//   }

//   goToproductdetailfromfavorite(itemsModel) {
//     Get.toNamed("productdetail", arguments: {"itemsmodel": itemsModel});
//     // pass data to productdetaill controller" another method transfer data
//     //key : value => itemsModel is pass and presnt to productdetail page
//   }
// }
