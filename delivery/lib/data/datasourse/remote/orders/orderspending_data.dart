

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPending {
  Crud crud;
  OrdersPending(this.crud);
  getData() async {// get all order status =2
    var response =
        await crud.postData(AppLink.viewpending, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
//===================================
 approve(String ordersid ,String usersid , String deliveryid) async {
    var response =
        await crud.postData(AppLink.approve, {
          "ordersid":ordersid,
          "usersid":usersid, // send notification to user
          "deliveryid":deliveryid // link between order and delivery table
        }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
