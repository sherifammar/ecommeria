

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailData {
  Crud crud;
  OrdersDetailData(this.crud);
  getordersData(String ordersid) async {
    

    var response = await crud
        .postData(AppLink.ordersdetail, {"ordersid": ordersid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  
}
