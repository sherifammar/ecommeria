import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class MyfavoriteviewData {
  Crud crud;
  MyfavoriteviewData(this.crud);
  getData(String id) async {
    // this method give l or r only

// var response = await crud.postData('http://192.168.1.3/ecommeria/favorite/viewmyfavorite.php', {"id":id});// {}== map
// return response.fold((l) => l, (r) => r);// error => l not 1

    var response = await crud
        .postData('${AppLink.viewmyfavorite}', {"id": id}); // {}== map
    return response.fold((l) => l, (r) => r);
  }

  deletData(String id) async {
    

    var response =
        await crud.postData('${AppLink.deletfavorite}', {"id": id}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }

    myfavoriteToproductdetailData(String itemsid) async {
    
    var response = await crud
        .postData(AppLink.myfavoriteToproductdetail, {"itemsid": itemsid}); // {}== map
    return response.fold((l) => l, (r) => r);

    //
  }


}
