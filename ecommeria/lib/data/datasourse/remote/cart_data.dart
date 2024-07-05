import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addcart(String usersid, String itemsid) async {
    // this method give l or r only
    var response = await crud.postData('${AppLink.addcart}', {
      "usersid": usersid,
      "itemsid": itemsid,
    });

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

// =====================================
  removecart(String usersid, String itemsid) async {
        var response = await crud.postData('${AppLink.removecart}', {
      "usersid": usersid,
      "itemsid": itemsid,
    }); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
// =====================================

  countItemscart(String usersid, String itemsid) async {
      var response = await crud.postData('${AppLink.countItemscart}', {
      "usersid": usersid,
      "itemsid": itemsid,
    });
    // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

//=====================================
  viewcart(String usersid) async {
    var response = await crud.postData(AppLink.viewcart, {
      "usersid": usersid,
    });
    // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

//============================
  // coupon(String couponname) async {
  //   var response = await crud.postData(AppLink.coupon, {"couponname": couponname});
  
  //   return response.fold((l) => l, (r) => r); // error => l not 1
  // }
  //====================new version 
  coupon(String couponname ,String usersid) async {
    var response = await crud.postData(AppLink.coupon, {"couponname": couponname,"usersid":usersid});
  
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
// ==============================================
 
}
