

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    // this method give l or r only
    //  new api :192.168.1.3

  
    //  var response = await crud.postData("http://192.168.1.3/ecommeria/aurh/login.php", 
    // {
    //    "email" : email , 
    //   "password" : password  , 
    
    // });

       var response = await crud.postData("${AppLink.login}", 
    {
       "email" : email , 
      "password" : password  , 
    
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
