import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class OrdersPending {
  Crud crud;
  OrdersPending(this.crud);
  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.pending, {"usersid": usersid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

// ==========================

  removeOrder(String ordersid) async {
    var response =
        await crud.postData('${AppLink.deletorders}', {'ordersid': ordersid});

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  // ==================================

}
