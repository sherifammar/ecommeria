

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPassWordForgetPasswordData{
  Crud crud;
  ResetPassWordForgetPasswordData(this.crud);
  postData(String email, String password) async {
    // this method give l or r only

    // var response = await crud.postData("http://192.168.1.3/ecommeria/forgetpassword/resetpassword.php", 
    // {
    //    "email" : email , 
    //   "password" : password  , 
    
    // });

     var response = await crud.postData("${AppLink.resetpassword}", 
    {
       "email" : email , 
      "password" : password  , 
    
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
