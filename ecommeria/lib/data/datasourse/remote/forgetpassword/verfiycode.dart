import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email, String Verifycode) async {
    // this method give l or r only

    // var response = await crud.postData("http://192.168.1.3/ecommeria/forgetpassword/verifycodecheckemail.php", 
    // {
    //    "email" : email , 
    //   "verfiycode" : Verifycode  ,
    
    // });

     var response = await crud.postData("${AppLink.verfiycode}", 
    {
       "email" : email , 
      "verfiycode" : Verifycode  ,
    
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
