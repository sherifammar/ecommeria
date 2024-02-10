
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class Archivedata {
  Crud crud;
  Archivedata(this.crud);
  
  
 
  archiveData() async {
    var response =
        await crud.postData(AppLink.archive, {}); // {}== map
    return response.fold((l) => l, (r) => r); // error => l not 1
  }


  
  }