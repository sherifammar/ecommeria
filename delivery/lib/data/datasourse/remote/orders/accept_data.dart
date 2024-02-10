import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Acceptorders {
  Crud crud;
  Acceptorders(this.crud);
  getData(String deliveryid) async {
    var response =
        await crud.postData(AppLink.viewaccept, {"deliveryid":deliveryid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

 done(String ordersid ,String usersid) async {
    var response =
        await crud.postData(AppLink.done, {
          "ordersid":ordersid,
          "usersid":usersid,
          
        }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

}