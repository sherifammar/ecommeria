import 'package:ecommeria/core/class/crud.dart';
import 'package:ecommeria/linkapi.dart';

class VerfiyCodeSignupData {
  Crud crud;
  VerfiyCodeSignupData(this.crud);
  postData( String email, String Verifycode) async {
    // this method give l or r only

    var response = await crud.postData("http://192.168.1.4/ecommeria/aurh/verfiycode.php", 
    {
      
      "email" : email , 
      "verfiycode" : Verifycode  , 
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }

  resendtData( String email) async {

    var response = await crud.postData("${AppLink.VerfiyCodeSignup}", 
    {
      
      "email" : email , 
     
    });
// {}== map

    return response.fold((l) => l, (r) => r); // error => l not 1
  }
}
