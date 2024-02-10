

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailData {
  Crud crud;
  OrdersDetailData(this.crud);

  getordersdetailData(String ordersid) async {
   
    var response = await crud
        .postData(AppLink.orderdetailsadmin, {"ordersid": ordersid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  
}
