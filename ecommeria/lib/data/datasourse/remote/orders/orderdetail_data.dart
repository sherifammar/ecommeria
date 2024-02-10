import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class OrdersDetailData {
  Crud crud;
  OrdersDetailData(this.crud);
  getordersData(String ordersid) async {
    // this method give l or r only

    var response = await crud
        .postData(AppLink.ordersdetail, {"ordersid": ordersid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  
}
