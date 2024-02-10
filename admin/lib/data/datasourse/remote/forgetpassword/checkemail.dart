

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    // this method give l or r only

    // var response = await crud.postData("http://192.168.1.3/ecommeria/forgetpassword/checkemail.php", 
    // {
    //    "email" : email , 
      
    
    // });
      var response = await crud.postData("${AppLink.checkemail}", 
    {
       "email" : email , 
      
    
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
