import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

// ignore: camel_case_types
class ratingItemsData {
  Crud crud;
  ratingItemsData(this.crud);

// ==========================

  getRatingitems(String itemsid) async {
    var response = await crud
        .postData(AppLink.allratingitemsview , {"itemsid": itemsid}); // {}== map
    return response.fold((l) => l, (r) => r);
  }

// ==========================



  addRatingItems(
    String usersid, 
  String usersname,
   String itemsid,
      String ratingitemsrate,
       String ratingitemscomment) async {
    var response = await crud.postData(AppLink.addRatingitems, {
      'usersid': usersid,
      'usersname': usersname,
      'itemsid': itemsid,
      'ratingitemsrate': ratingitemsrate,
      'ratingitemscomment': ratingitemscomment,
    });
    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
