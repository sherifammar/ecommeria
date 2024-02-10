import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


///=================================

class ViewAccept {
  Crud crud;
 ViewAccept(this.crud);
  getData() async {
    var response =
        await crud.postData(AppLink.viewaccept, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
  // approve(String ordersid, String usersid , String orderstype) async {
  //   var response = await crud.postData(AppLink.prepare, {
  //     "ordersid": ordersid,
  //     "usersid": usersid,
  //     "orderstype":orderstype
  //   }); // {}== map
  //   return response.fold((l) => l, (r) => r); // error => l not 1
  // }

    
  donePrepare(String ordersid, String usersid , String orderstype) async {
    var response = await crud.postData(AppLink.prepare, {
      "ordersid": ordersid,
      "usersid": usersid,
      "orderstype":orderstype
    }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}