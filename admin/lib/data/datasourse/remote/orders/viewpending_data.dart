

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ViewapprovePending {
  Crud crud;
 ViewapprovePending(this.crud);
  getData() async {
    var response =
        await crud.postData(AppLink.viewpending, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

 approeOrder(String ordersid ,String usersid ) async {
    var response =
        await crud.postData(AppLink.approve, {
          "ordersid":ordersid,
          "usersid":usersid,
          
        }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
