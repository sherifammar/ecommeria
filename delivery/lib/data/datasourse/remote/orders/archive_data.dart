
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Archive {
  Crud crud;
  Archive(this.crud);
  
  
 
  archiveData(String deliveryid) async {
    var response =
        await crud.postData(AppLink.viewarchive, {"deliveryid": deliveryid}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }


  
  }