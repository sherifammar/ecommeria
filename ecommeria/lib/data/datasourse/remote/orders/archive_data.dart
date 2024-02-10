
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Archive {
  Crud crud;
  Archive(this.crud);
  
  
 
  archiveData(String usersid) async {
    var response =
        await crud.postData(AppLink.archive, {"usersid": usersid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  //  ============================
  ratingDaligo(String ordersid,String ordersrating, String ordersnotrating) async {
    var response = await crud.postData(AppLink.rating, {
      "ordersid":ordersid,
      "ordersrating": ordersrating,
      "ordersnotrating": ordersnotrating
    }); // {}== map
    return response.fold((l) => l, (r) => r);
  } 
  
  
  }